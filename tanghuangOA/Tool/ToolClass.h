//
//  ToolClass.h
//  智慧军营
//
//  Created by Crab on 2017/5/5.
//  Copyright © 2017年 Crab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ToolClass : NSObject
+ (void)refreshUI:(NSString *)str message:(NSString *)msg Controller:(UIViewController *)controller;

+(void)backgroundImage:(NSString *)imageStr addView:(UIView *)view;

+(id)showwithCircleDailog:(NSString*)string;

+ (NSString *)dicTransformToJsonString:(NSDictionary *)dic;
//请求的结果  返回字典形式
+ (NSDictionary *)getDicFromResponseStr:(NSString *)str;


@end
