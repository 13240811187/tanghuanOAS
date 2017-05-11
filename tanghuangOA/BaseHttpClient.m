//
//  BaseHttpClient.m
//  tanghuangOA
//
//  Created by Orangels on 2017/5/4.
//  Copyright © 2017年 ls. All rights reserved.
//

#import "BaseHttpClient.h"

@implementation BaseHttpClient

- (instancetype)init
{
    self = [super init];
    if (self) {
       _manager=[AFHTTPSessionManager manager];
        
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept" ];
        
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/html", @"text/plain",nil];
//        //处理 response 中的空值
//        ((AFJSONResponseSerializer *)_manager.responseSerializer).removesKeysWithNullValues = YES;
    }
    return self;
}

+(BaseHttpClient *)sharedBaseHttpClient{
    static BaseHttpClient* shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareClient = [[BaseHttpClient alloc] init];
    });
    return shareClient;
}

#pragma mark -- 请求接口
+(void)requestWithHttpType:(HTTP_TYPE)type andParameters:(NSDictionary *)parameters andURL:(NSString *)url andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler{
    switch (type) {
        case GET:
            [BaseHttpClient httpGetWithURL:url andParameters:parameters andSucHandler:sucHandler andFailHandler:failHandler];
            break;
        case POST:
            [BaseHttpClient httpPostWithURL:url andParameters:parameters andSucHandler:sucHandler andFailHandler:failHandler];
            break;
        default:
            break;
    }
}

+ (void)httpGetWithURL:(NSString*)url andParameters:(NSDictionary*)param andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler{
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [[BaseHttpClient sharedBaseHttpClient].manager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                sucHandler(obj);
            });
        }else{
            NSError* error = [[NSError alloc] initWithDomain:@"请求数据返回为空" code:9999 userInfo: nil];
            failHandler(error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            failHandler(error);
        });
    }];
    
}

+ (void)httpPostWithURL:(NSString*)url andParameters:(NSDictionary*)param andSucHandler:(HttpSuc)sucHandler andFailHandler:(HttpFail)failHandler{
    
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [[BaseHttpClient sharedBaseHttpClient].manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            id obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                sucHandler(obj);
            });
        }else{
            NSError* error = [[NSError alloc] initWithDomain:@"请求数据返回为空" code:9999 userInfo: nil];
            failHandler(error);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            failHandler(error);
        });
    }];
    
}

+(void)cancelHttpOperations{
    [[BaseHttpClient sharedBaseHttpClient].manager.operationQueue cancelAllOperations];
}




@end
