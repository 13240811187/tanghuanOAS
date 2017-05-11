//
//  OATabBarController.m
//  tanghuangOA
//
//  Created by Orangels on 2017/5/4.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "OATabBarController.h"
#import "taskViewController.h"
#import "mineViewController.h"
#import "contactsViewController.h"


@interface OATabBarController ()

@end

@implementation OATabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabBarChildController];
}

- (void)setupTabBarChildController{
    NSArray* imgArr = @[@"contacts",@"app",@"mine"];
    NSArray* selectArr = @[@"contacts_pre",@"app_pre",@"mine_pre"];
    NSArray* titleArr = @[@"联系人",@"应用",@"我"];
    
    contactsViewController* contactsVC = [[contactsViewController alloc] init];
    taskViewController* taskVC = [[taskViewController alloc] init];
    mineViewController* mineVC = [[mineViewController alloc] init];
    NSArray* vcArr = @[contactsVC,taskVC,mineVC];
    
    for (int i = 0; i<3; i++) {
        UIViewController* vc = vcArr[i];
        vc.title = titleArr[i];
        vc.tabBarItem.image = [[UIImage imageNamed:imgArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [self addChildViewController:nav];
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
