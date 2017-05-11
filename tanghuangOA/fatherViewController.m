//
//  fatherViewController.m
//  tanghuangOA
//
//  Created by Crab on 2017/5/11.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "fatherViewController.h"
#import "responseBuilder.h"
@interface fatherViewController ()

@end

@implementation fatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLeftItemImageName:@"nav_back"];

    
}


- (void)setLeftItemImageName:(NSString *)imageName
{
    self.navigationItem.leftBarButtonItems=nil;
    
    if (!imageName.length) {
        return;
    }
    UIButton *leftBtn = [responseBuilder buttonNormalImage:imageName hightLightImage:imageName frame:CGRectMake(0, 0, 40, 40) target:self selector:@selector(navibarLeftBtnClick:)];
    
    
    leftBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItems = @[leftBarItem];
    
}

- (void)navibarLeftBtnClick:(UIButton*)leftBtn
{
    NSLog(@"左边按钮");
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
