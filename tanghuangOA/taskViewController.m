//
//  taskViewController.m
//  tanghuangOA
//
//  Created by Orangels on 2017/5/4.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "taskViewController.h"
#import "XSIdentifiCollectionViewCell.h"
#import "ButtonClass.h"
#import "XSLineLayout.h"
#define WI [UIScreen mainScreen].bounds.size.width
#define HE [UIScreen mainScreen].bounds.size.height
#define BackGrouColor [UIColor colorWithRed:222./255 green:222./255 blue:222./255 alpha:1.0]
#define  CELLW  (WI-46*2)

#define  CELLH  180

static NSString *seriesCollectionCellIndentify = @"videoCollectionCellIndentify";
@interface taskViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    
    BOOL _isFirst;
    
    BOOL _refreshTableview;//验证完回来刷新列表的时候
    
}


@property(nonatomic,strong)NSMutableArray * btnArray;
@property (nonatomic,strong)UICollectionView *mycollectView;
@property (nonatomic,strong)UIScrollView * scrollerView;
@end

@implementation taskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self creatButton];
    [self setupCollectionView];
}

-(void)creatButton{
    
    NSArray *title=@[@"我的申请",@"我的审批"];
    
    for(int i=0; i<title.count; i++){
        
        ButtonClass * btn =[ButtonClass buttonWithType:UIButtonTypeCustom];
        
        btn.frame=CGRectMake(10*i+i*(WI-40)/2+10,65,(WI-40)/2,80);
        
        
        [btn setTitle:title[i] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        btn.tag=100+i;
        
        if (i==0) {
            btn.selected=YES;
        }
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        
        
        btn.backgroundColor = BackGrouColor;
        [btn addBottomBtnView];
        
        [self.view addSubview:btn];
        
        [self.btnArray addObject:btn];
    }

}


-(void)setupCollectionView

{
   
    
    XSLineLayout *layout=[[XSLineLayout alloc]init];
    
    layout.itemSize = CGSizeMake(CELLW, CELLH);
    
    self.mycollectView=[[UICollectionView alloc]initWithFrame:CGRectMake(0,164,WI,200) collectionViewLayout:layout];
    
    self.mycollectView.delegate=self;
    
    self.mycollectView.dataSource=self;
    
    self.mycollectView.backgroundColor=[UIColor grayColor];
    
    [self.view addSubview:self.mycollectView];
    

    [self.mycollectView registerClass:[XSIdentifiCollectionViewCell class] forCellWithReuseIdentifier:seriesCollectionCellIndentify];
    
}


-(void)buttonClick:(ButtonClass *)sender{
    
    
    for (ButtonClass * button in self.btnArray) {
        
        button.selected=NO;
        [button hiddenVeiw];
        
    }
    
    
    sender.selected=YES;
    
    [sender hiddenVeiw];
    
    NSInteger index=sender.tag-100;
    [self.mycollectView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    XSIdentifiCollectionViewCell *seriesCell=[collectionView dequeueReusableCellWithReuseIdentifier:seriesCollectionCellIndentify forIndexPath:indexPath];
    
    if (!seriesCell) {
        
        seriesCell = [[XSIdentifiCollectionViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:seriesCollectionCellIndentify andIndexPath:indexPath];
    }
  
    
    
    if (!_isFirst) {//第一次进来第一个是1 让其他的变成0.8
        if (indexPath.row!=0) {
            seriesCell.transform =CGAffineTransformMakeScale(0.88, 0.88);
        }
        _isFirst=!_isFirst;
        
    }else{//为了返回时都是0.8
        
        seriesCell.transform =CGAffineTransformMakeScale(0.88, 0.88);
        
        
    }
    
    //    XSIdentificationMode *mode=[self.dataArray objectAtIndex:indexPath.row];
    //
    //    [seriesCell updateMode:mode];
    
    return seriesCell;
}



#pragma mark 根据偏移量来确定按钮的状态
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSInteger index=0;
    
    //移动 一个 item的宽 + 最小item之间的间距
    if (scrollView.contentOffset.x==CELLW+10) {
        index=1;
        
    }else if(scrollView.contentOffset.x==2*(CELLW+10)){
        index=2;
        
    }else{
        index=0;
    }
    
    for (ButtonClass *btton in self.btnArray) {
        btton.selected=NO;
        
        [btton hiddenVeiw];
    }
    
    ButtonClass *btn=(ButtonClass *)[self.btnArray objectAtIndex:index];
    
    btn.selected=YES;
    
    [btn hiddenVeiw];
    
}



#pragma mark cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击图片%d",indexPath.row);
}


-(NSMutableArray *)btnArray
{
    if (!_btnArray) {
        _btnArray=[[NSMutableArray alloc] init];
    }
    
    return _btnArray;
    
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
