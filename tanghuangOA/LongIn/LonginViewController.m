//
//  LonginViewController.m
//  智慧军营
//
//  Created by Crab on 2017/5/5.
//  Copyright © 2017年 Crab. All rights reserved.
//

#import "LonginViewController.h"
#import "ToolClass.h"
#import "UIView+Extension.h"
#import "AppDelegate.h"
#import "OATabBarController.h"
@interface LonginViewController ()
{
    UITextField * UserTextField;
    UITextField * PassWordTextField;
    UIButton * longinBtn;
}

@end

@implementation LonginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self creatUI];
    
    
}

- (void)creatUI{
    
     [ToolClass backgroundImage:@"login.png" addView:self.view];
    
    UserTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, SCHEIGHT/2-70,SCWIDTH-40 ,40)];
    [UserTextField setBorderStyle:UITextBorderStyleRoundedRect];
    UserTextField.placeholder = @"请输入用户名";
    UserTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.view addSubview:UserTextField];
    
    PassWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(UserTextField.x,UserTextField.bottom+20,UserTextField.width,UserTextField.height)];
    [PassWordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    PassWordTextField.placeholder = @"请输入动态口令";
    PassWordTextField.secureTextEntry = YES;
    PassWordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    [self.view addSubview:PassWordTextField];
    
    
    
    longinBtn = [[UIButton alloc]initWithFrame:CGRectMake(PassWordTextField.x, PassWordTextField.bottom+30,PassWordTextField.width, PassWordTextField.height)];
    
    [longinBtn setBackgroundImage:[UIImage imageNamed:@"loginbutton.png"] forState:UIControlStateNormal];
    
    [longinBtn addTarget:self action:@selector(landBttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:longinBtn];
    

    
}

#pragma mark 登录按钮
- (void)landBttonClick{
    
  
    AppDelegate *aDelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    OATabBarController *mytab=[[OATabBarController alloc]init];
    aDelegate.window.rootViewController = mytab;
}


// 取消第一响应者
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self disResignFirstResponder];
}

// 取消第一响应
- (void)disResignFirstResponder{
    [UserTextField resignFirstResponder];
    [PassWordTextField resignFirstResponder];
    
}

//结束编辑调用的方法
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self disResignFirstResponder];
    return YES;
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
