//
//  HTTPDataRequst.h
//  AF3.0封装
//
//  Created by Wayne on 2017/4/14.
//  Copyright © 2017年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^FinshBlock)(id data, NSError *error, NSURLSessionDataTask *task);

@interface HTTPDataRequst : NSObject
// POST 请求
+ (void)postYourDataWithUrl:(NSString *)url andData:(NSDictionary *)dic complication:(FinshBlock)complication;
+ (void)getYourDataWithUrl:(NSString *)url andData:(NSString *)data complication:(FinshBlock)complication;

@end
