//
//  HTTPDataRequst.m
//  AF3.0封装
//
//  Created by Wayne on 2017/4/14.
//  Copyright © 2017年 Wayne. All rights reserved.
//

#import "HTTPDataRequst.h"


@implementation HTTPDataRequst

// POST 请求
+ (void)postYourDataWithUrl:(NSString *)url andData:(NSDictionary *)dic complication:(FinshBlock)complication{
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept" ];
    
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain",nil];
    
    [manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                complication(obj,nil,nil);
            });
        }
        
        
//        NSString *jsonString = [[NSString alloc] initWithData:responseObject
//                                
//                                                     encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"====%@",jsonString);
        

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}
// GET 请求
+ (void)getYourDataWithUrl:(NSString *)url andData:(NSString *)data complication:(FinshBlock)complication{
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //    //申明请求的数据是json类型
    manager.requestSerializer =[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"text/html",@"application/json", nil];
    
    [manager GET:url parameters:data progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
   
    }];
    
}

@end
