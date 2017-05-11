//
//  ViewController.m
//  指纹识别
//
//  Created by Crab on 2017/5/3.
//  Copyright © 2017年 Crab. All rights reserved.
//

#import "TouchIDViewController.h"
#import "LocalAuthentication/LAContext.h"
#import "ToolClass.h"
#import "ToolView.h"
#import "LonginViewController.h"

@interface TouchIDViewController ()

@end

@implementation TouchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatView];
    
    
}

- (void)creatView{
    self.navigationController.navigationBar.hidden=YES;
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, SCWIDTH, SCHEIGHT)];
    
    imageView.image = [UIImage imageNamed:@"背景图片.jpg"];
    
    [self.view addSubview:imageView];
    


    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, SCHEIGHT-100,SCWIDTH,40)];
    [btn setTitle:@"请点击验证指纹后进入登录界面" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor clearColor];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:btn];

    
    
}

- (void)btnClick{
    
    [self newtouchid];
  
}




-(void)newtouchid{
    
    LAContext
    *myContext = [[LAContext
                   alloc]
                  init];
    
    NSError
    *authError = nil;
    
    //授权原因
    
    NSString
    *myLocalizedReasonString = @"我需要授权";
    
     myContext.localizedFallbackTitle = @"";
    
    //if条件判断设备是否支持Touch
//    ID 是否开启Touch id等这个一定要写上（曾经3D
//    Touch使用的时候没判断导致iOS9以后的系统启动app就崩溃）
    
    if
        ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                                error:&authError]) {
            
            //弹出指纹识别界面
            
            [myContext
             evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
             localizedReason:myLocalizedReasonString
             reply:^(BOOL
                     success, NSError *authenticationError)
             {
                 
                 if
                     (success) {
                         
                    
                        
                        
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 
                                 LonginViewController * longin = [[LonginViewController alloc] init];
                                 
                                 [self.navigationController pushViewController:longin animated:YES];
                                 
                                 NSLog(@"验证成功");
                                 
                             });
                             
                      
                         
                        
                        
                
                         
                     }
                 
                 else {
                     
                     
                     
                     switch (authenticationError.code)
                     {
                             
                             
                             
                         case
                         kLAErrorAuthenticationFailed:
                             
                         {
                             
                             NSLog(@"用户提供的指纹不对");
                             
                             [ToolClass refreshUI:@"请重新点击" message:@"您提供的指纹不正确" Controller:self];
                             
                             
                             break;
                             
                         }
                             
                         case
                         kLAErrorUserCancel:
                             
                         {
                             
                             
                             NSLog(@"用户点击了取消按钮");
                             
                             break;
                             
                         }
                             
                         case
                         kLAErrorUserFallback:
                             
                         {
                             
                             
                             NSLog(@"用户选择输入密码");
                             
                             
                             
                             break;
                             
                         }
                             
                         case
                             kLAErrorSystemCancel :
                             
                         {
                             
                             
                             NSLog(@"切换到其他的app(按了Home按键)，被系统取消");
                             
                             
                             
                             break;
                             
                         }//
                             
                         case
                             kLAErrorTouchIDLockout :
                             
                         {
                             NSLog(@"用户指纹错误多次，TOuch id被锁定");
                             
                             [self alertView];
                           
                             
                             
                                   break;
                                   
                                   }//9.0
                             
                                   
                                   case
                                   kLAErrorAppCancel:
                                   
                                   {
                                       
//                                       我试了验证过程中电话进来
//                                       返回的LAErrorSystemCancel
//                                       错误码
//                                       不是这个
                                       
                                       NSLog(@"被(突如其来的)应用（电话）取消");
                                       
                                       
                                       
                                       
                                       break;
                                       
                                   }//LAErrorInvalidContex
                                   
                                   default:
                                   
                                   {
                                       
                                       
                                       
                                       break;
                                       
                                   }
                                   
                                   }
                                   
                                   
                                   
                                   }
                                   
                                   
                                   
                                   }]; 
                                   
                                   }
                                   
                                   else {
                                       
                                       
                                       
                                       
                                       switch (authError.code)
                                       {
                                               
                                               
                                               //9.0
//                                               试过了不设置密码返回的是 LAErrorTouchIDNotEnrolled
//                                               错误码
//                                               
                                               
                                           case
                                           kLAErrorPasscodeNotSet:
                                               
                                           {
                                               
                                               
                                               NSLog(@"在设置里面没有设置密码");
                                               
                                               
                                               break;
                                               
                                           }
                                               
                                               
                                           case
                                           kLAErrorTouchIDNotAvailable:
                                               
                                           {
                                               
                                               
                                               NSLog(@"设备不支持Touch id");
                                                     
                                                     
                                                     
                                                     break;
                                                     
                                                     }
                                                     
                                                     
                                                     case
                                                     kLAErrorTouchIDNotEnrolled:
                                                     
                                                     {
                                          
                                                         
                                                         
                                                         //                             在适当的时候，调用此方法跳转到对应的设置界面
                                                         
                                                         //定位服务设置界面
                                                             NSURL *url = [NSURL URLWithString:@"App-Prefs:root=TOUCHID_PASSCODE"];
                                                             if ([[UIApplication sharedApplication] canOpenURL:url])
                                                             {
                                                                 [[UIApplication sharedApplication] openURL:url];
                                                             }
                                                             

                                      
                                                        NSLog(@"在设置里面没有设置Touch id指纹");
                                                               
                                                               
                                                               
                                                               break;
                                                               
                                                               }
                                                               
                                                               
                                                               case
                                                               kLAErrorInvalidContext:
                                                               
                                                               {
                                                                   
                                                                   
                                                                   NSLog(@"创建的指纹对象失效");
                                                                   
                                                                   
                                                                   break;
                                                                   
                                                               }
                                                               
                                                               
                                                               
                                                               
                                                               
                                                               default:
                                                               
                                                               {
                                                                   
                                                                   [self alertView];
                                                                   
                                                                   break;
                                                                   
                                                               }
                                                               
                                                               }
                                                               
                                                               }

                                                               
                                                               
                                                               
                                                               }





- (void)alertView{
    
    
    UIAlertController * alerController= [UIAlertController alertControllerWithTitle:@"" message:@"您指纹错误多次,Touch id被锁定,请跳到设置页面进行解除锁定" preferredStyle:UIAlertControllerStyleAlert];
    
    [alerController addAction:({UIAlertAction * aleraction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSURL *url = [NSURL URLWithString:@"App-Prefs:root=TOUCHID_PASSCODE"];
        if ([[UIApplication sharedApplication] canOpenURL:url])
        {
            [[UIApplication sharedApplication] openURL:url];
        }
        
        
        
    }];
        aleraction;
    })];
    
    
    //模态弹出提示框
    [self presentViewController:alerController animated:YES completion:nil];
 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
