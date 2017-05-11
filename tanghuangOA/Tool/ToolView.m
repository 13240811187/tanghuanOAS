//
//  ToolView.m
//  智慧军营
//
//  Created by Crab on 2017/5/5.
//  Copyright © 2017年 Crab. All rights reserved.
//

#import "ToolView.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
@interface ToolView ()

@end
@implementation ToolView


// 提示框
+ (void)messageInfo:(NSString *)strInfo{
    // 提示框
    AppDelegate *aDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MBProgressHUD * HUD = [[MBProgressHUD alloc] init];
      HUD.labelText = strInfo;
    [aDelegate.window addSubview:HUD];
    //1,设置背景框的透明度  默认0.8
     HUD.opacity = 0.7;
    [HUD show:YES];
    [HUD hide:YES afterDelay:1.5];

}



@end
