//
//  mineViewController.m
//  tanghuangOA
//
//  Created by Orangels on 2017/5/4.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "mineViewController.h"
#import "BaseHttpClient.h"
#import "AFNetworking.h"
#import "SetUpTableView.h"
#import "mineModel.h"
#import "MJExtension.h"
#import "wagesDetailsViewController.h"
#import "MineDetailsView.h"
@interface mineViewController ()<setUpViewDelegate>

@property(nonatomic,strong)SetUpTableView * setUpView;
@property(nonatomic,strong)NSDictionary * dataDic;



@end

@implementation mineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    


    //[self click];
     [self requestPerson];
   
     [self.view addSubview:self.setUpView];
    
   
    
    
    
}

-(SetUpTableView *)setUpView{
    
    if (!_setUpView) {
        _setUpView = [[SetUpTableView alloc] initWithFrame:CGRectMake(0, 0,SCWIDTH,SCHEIGHT-44)];
        _setUpView.delegate = self;
    }
    
    return _setUpView;
    
    
}





- (void)requestPerson{
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
    
    dic[@"usernum"] = @5;
    
    NSString *url=@"http://192.168.1.74/Home/Person/app_person";
     //NSString *url=@"http://192.168.1.74/Home/Wage/app_wage";
    
    
    
    
    [BaseHttpClient requestWithHttpType:POST andParameters:dic andURL:url andSucHandler:^(id data) {
        
//        NSString *jsonString = [[NSString alloc] initWithData:data
//                                
//                                                     encoding:NSUTF8StringEncoding];
//        
        NSDictionary * dic = (NSDictionary *)data;
        self.dataDic = dic[@"data"];
        NSLog(@"====%@",dic);
        
        self.setUpView.userLabel.text = [NSString stringWithFormat:@"%@",self.dataDic[@"department"]];
        
        self.setUpView.PhoneLabel.text = [NSString stringWithFormat:@"%@",self.dataDic[@"gender"]];
        
        [self.setUpView.tableView reloadData];
        
    } andFailHandler:^(NSError *error) {
        
        
        
    }];
    

}






- (void)MySetViewController:(id)sender indexPath:(NSInteger)index{
    
    switch (index) {
        case myNewsCV:
        {
            
            wagesDetailsViewController * wages = [[wagesDetailsViewController alloc] init];
           [self.navigationController pushViewController:wages animated:YES];
            
            break;
        }
        case MywebViewCV:
        {
            
//            
//            webViewViewController * webVC = [[webViewViewController alloc] init];
//            
//            UIBarButtonItem *returnButtonItem = [[UIBarButtonItem alloc] init];
//            returnButtonItem.title = @"返回";
//            self.navigationItem.backBarButtonItem=returnButtonItem;
//            [self.navigationController pushViewController:webVC animated:YES];
            
            break;
        }
            
        case SignOut:
        {
//            // 清除用户信息
//            
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userId"];
//            
//            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"automaticlogon"];
//            
//            
//            AppDelegate *aDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//            
//            
//            
//            LandViewController  * land = [[LandViewController alloc]init];
//            aDelegate.window.rootViewController =land;
//            
            
            
            
            break;
            
        }
            
        case version:
        {
//            
//            //提示信息
//            [HUDView messageHud:@"已经是最新版本" HUDview:self.view];
            
            
            
            
            break;
            
        }
            
            
            
        default:
            break;
    }
    
    
    
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
