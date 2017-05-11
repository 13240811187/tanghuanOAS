//
//  ToolClass.m
//  智慧军营
//
//  Created by Crab on 2017/5/5.
//  Copyright © 2017年 Crab. All rights reserved.
//

#import "ToolClass.h"


@interface ToolClass ()

@end
@implementation ToolClass
// 主线程刷新 UI
+ (void)refreshUI:(NSString *)str message:(NSString *)msg Controller:(UIViewController *)controller {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:str
                                                                       message:msg
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        [controller presentViewController:alert animated:YES completion:^{
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alert dismissViewControllerAnimated:YES completion:nil];
            });
        }];
    });
}


+(void)backgroundImage:(NSString *)imageStr addView:(UIView *)view{
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageStr]];
    
    imgView.frame =CGRectMake(0,0,SCWIDTH, SCHEIGHT);
    
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    
    [view insertSubview:imgView atIndex:0];
    
}


//字典转JSON 格式的字符串
+ (NSString *)dicTransformToJsonString:(NSDictionary *)dic {
    //NSJSONWritingPrettyPrinted
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
}

// 字符串转字典
+ (NSDictionary *)getDicFromResponseStr:(NSString *)str {
    
    NSData *resData = [[NSData alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    
    return resultDic;
}



@end
