//
//  wagesDetailsViewController.m
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "wagesDetailsViewController.h"
#import "MineDetailsView.h"
#import "mineModel.h"
#import "API.h"
@interface wagesDetailsViewController ()
@property (nonatomic,strong)MineDetailsView * mineDetailsView;
@property (nonatomic,strong)NSMutableArray * mineDataArray;
@end

@implementation wagesDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self click];
    [self.view addSubview:self.mineDetailsView];
    
    
}

- (NSMutableArray *)mineDataArray{
    
    if (!_mineDataArray) {
        _mineDataArray = [[NSMutableArray alloc] init];
        
    }
    return _mineDataArray;
    
}


- (void)click{
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    dic[@"id"] = @7;
    
    //NSString *url=@"http://192.168.1.74/Home/Person/app_person";
    NSString *url=@"http://192.168.1.74/Home/Wage/app_wage";
    
    
    //    NSString *url=@"http://192.168.1.74/Home/Login/app_login";
    
    
    [HTTPDataRequst postYourDataWithUrl:url andData:dic complication:^(id data, NSError *error, NSURLSessionDataTask *task) {
        
        
        
                if ([data[@"code"] isEqualToString:@"1"]) {
        

                   self.mineDataArray  = [mineModel mj_objectArrayWithKeyValuesArray:data[@"data"]];
        
                    NSLog(@"%@",data[@"data"]);
                    
                    self.mineDetailsView.dataArray = self.mineDataArray;
                    [self.mineDetailsView.tableView reloadData];
               }
        
        
        
    }];
    
    
  
    int a = 100000;
    
    CGFloat mo= a/ 1000;
    
    NSLog(@"%f",mo);
    
    
}


- (MineDetailsView *)mineDetailsView{
    
    
    if (!_mineDetailsView) {
        _mineDetailsView = [[MineDetailsView alloc]initWithFrame:CGRectMake(0,0,SCWIDTH,SCHEIGHT-64)];
        
    }
    
    return _mineDetailsView;
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
