//
//  contactsViewController.m
//  tanghuangOA
//
//  Created by Orangels on 2017/5/4.
//  Copyright © 2017年 ls. All rights reserved.
//

/*
    暂时没有接口,后续有接口再处理 model 数据,做具体处理,现在只做一个 plist 的页面展示,不设计查询
 
 */





#import "contactsViewController.h"
#import "person.h"
#import "API.h"
#import "BaseHttpClient.h"
#import "contactsHeaderView.h"
#import "PinYin4Objc.h"
#import "personViewController.h"


#define numTRUE [NSNumber numberWithBool:YES]
#define numFALSE  [NSNumber numberWithBool:NO]

@interface contactsViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController * searchController;
@property (nonatomic, strong) UITableView        * tableView;

@property (nonatomic, strong) NSMutableArray <person *> * contactsArr; /* 联系人arr */
@property (nonatomic, strong) NSMutableArray            * searchArr; /* 搜索arr */
@property (nonatomic, strong) NSMutableArray            * isExpandedArr;

@property (nonatomic, strong) NSDictionary          * contactsDic;
@property (nonatomic, strong) NSArray               * sectionArr;
@property (nonatomic, strong) NSArray               * keyArr;      //部门名称
@property (nonatomic, strong) NSMutableArray        * cnNameArr;   //中文名 arr
@property (nonatomic, strong) NSMutableArray        * enNameArr;   //英文名 arr
@property (nonatomic, strong) NSMutableDictionary   * nameMapDic;  //中英文名字映射

@end

@implementation contactsViewController

-(void)viewWillDisappear:(BOOL)animated{
    _searchController.active = NO;
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readData];
    [self creatUI];
    [self chineseToPinYinWithArr:_cnNameArr];
    self.definesPresentationContext=YES;
    
}

#pragma mark 转拼音 在获得 person 后,传入 name 数组
- (void)chineseToPinYinWithArr:(NSArray*)nameArr{
    
    for (NSString* name in nameArr) {
        HanyuPinyinOutputFormat *outputFormat = [[HanyuPinyinOutputFormat alloc] init];
        [outputFormat setToneType:ToneTypeWithoutTone];
        [outputFormat setVCharType:VCharTypeWithV];
        [outputFormat setCaseType:CaseTypeLowercase];
        NSString *EnglishName = [PinyinHelper toHanyuPinyinStringWithNSString:name withHanyuPinyinOutputFormat:outputFormat withNSString:@" "];
        
        [_enNameArr addObject:EnglishName];
        [_nameMapDic setObject:name forKey:EnglishName];
    }
    
}



//TODO: replace HTTPRequest
- (void)readData{
    
    _contactsArr = [NSMutableArray array];
    _searchArr   = [NSMutableArray array];
    _isExpandedArr = [NSMutableArray array];
    
//    [BaseHttpClient requestWithHttpType:GET andParameters:nil andURL:CONTACTSURL andSucHandler:^(id data) {
//        NSDictionary* dic = (NSDictionary*)data;
//        //解析 json-->contactsArr;
//    } andFailHandler:^(NSError *error) {
//        NSLog(@"%@",error.localizedDescription);
//    }];
    //测试
    [self readTest];
}



- (void)readTest{
    _cnNameArr = [NSMutableArray array];
    _enNameArr = [NSMutableArray array];
    _nameMapDic = [NSMutableDictionary dictionary];
    
    _contactsDic = [NSDictionary dictionary];
    _keyArr = [NSArray array];
    _sectionArr = [NSArray array];
    
    _contactsDic = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"]];
    _keyArr = [_contactsDic allKeys];
    _sectionArr = @[_contactsDic[_keyArr[0]],_contactsDic[_keyArr[1]],_contactsDic[_keyArr[2]],_contactsDic[_keyArr[3]]];
    for (int i = 0; i<_keyArr.count; i++) {
        [_isExpandedArr addObject:numTRUE];
    }
    
    //填充 cnNameArr
    for (NSArray* personArr in _sectionArr) {
        for (NSString* name in personArr) {
            [_cnNameArr addObject:name];
        }
    }
    
}

- (void)refresh:(UIRefreshControl*)refreshControl{
    [self readData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [refreshControl endRefreshing];
        [_tableView reloadData];
    });
}

- (void)creatUI{
    //tableView
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-44) style:UITableViewStylePlain];
    
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    _tableView.rowHeight  = 50;
    
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.refreshControl                 = [UIRefreshControl new];
    _tableView.refreshControl.tintColor       = [UIColor blueColor];
    _tableView.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [_tableView.refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    [_tableView registerNib:[UINib nibWithNibName:@"contactsHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"header"];
    [self.view addSubview:_tableView];
    
    //searchController
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchBar.frame = CGRectMake(0, 0, WIDTH-100, 40);
    _searchController.searchBar.placeholder = @"搜索";
    _tableView.tableHeaderView = _searchController.searchBar;
    
    //default yes
    _searchController.hidesNavigationBarDuringPresentation = NO;
    _searchController.obscuresBackgroundDuringPresentation = NO;
    _searchController.searchResultsUpdater = self;
}

#pragma mark  - searchControllerDelegate 和 UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    [_searchArr removeAllObjects];
    for (NSString* enName in _nameMapDic) {
        if ([enName rangeOfString:[searchController.searchBar.text lowercaseString]].location != NSNotFound ||
            [_nameMapDic[enName] rangeOfString:[searchController.searchBar.text lowercaseString]].location != NSNotFound) {
            [_searchArr addObject:_nameMapDic[enName]];
        }
    }
    [_tableView reloadData];
}

#pragma mark -- tableView delegate dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_searchController.isActive) {
        return _searchArr.count;
    }else{
        // 返回各个部门成员的数量
        // 这里返回1 用于测试
        
        NSArray* arr = _sectionArr[section];
        
        return [_isExpandedArr[section] boolValue] ? arr.count : 0;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_searchController.isActive) {
        return 1;
    }else{
        // 返回部门的数量
        // 这里返回1 用于测试
        return _sectionArr.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.imageView.image = [UIImage imageNamed:@"Female"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (_searchController.isActive) {
        cell.textLabel.text = _searchArr[indexPath.row];
    }else{
        cell.textLabel.text = _sectionArr[indexPath.section][indexPath.row];
        
    }
    
    return cell;
}
//sectionHeader
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
//section headerView
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (_searchController.isActive) {
        UITableViewHeaderFooterView* view = [[UITableViewHeaderFooterView alloc] init];
        view.textLabel.text = @"搜寻结果";
        return view;
        return nil;
    }else{
        contactsHeaderView* headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
        headerView.contactsTextLabel.text = _keyArr[section];
        headerView.isExpanded = [_isExpandedArr[section] boolValue];
        headerView.tapHandler = ^(BOOL isExpanded) {
            _isExpandedArr[section] = [NSNumber numberWithBool:isExpanded];
            [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
        };
        return headerView;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    personViewController* personVC = [[personViewController alloc] init];
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    personVC.name = cell.textLabel.text;
    personVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:personVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
















































