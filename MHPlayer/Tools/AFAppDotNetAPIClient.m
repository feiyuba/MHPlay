//
//  AFAppDotNetAPIClient.m
//  MHPlayer
//
//  Created by 飞鱼 on 2017/12/28.
//  Copyright © 2017年 马浩. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"

static NSString * const AFAppDotNetAPIBaseURLString = @"http://c.m.163.com/nc/video/home/0-10.html";

@implementation AFAppDotNetAPIClient

+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        [_sharedClient setRequestSerializer:[AFJSONRequestSerializer serializer]];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    
    return _sharedClient;
}

+ (AFHTTPSessionManager*)defaultNetManager {
    
    static AFHTTPSessionManager *manager;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 10;
        
        [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        
    });
    
    return manager;
    
}

+ (void)POST:(NSString*)url parameters:(NSDictionary*)parameter returnData:(void (^)(NSData * resultData,NSError * error))returnBlock{
    //请求队列管理者 单例创建形式 防止内存泄漏
    
    AFHTTPSessionManager * manager = [AFAppDotNetAPIClient sharedClient];
    
    //[manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    [manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        returnBlock(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        returnBlock(nil,error);
        
    }];
}

+ (void)GET:(NSString*)url parameters:(NSDictionary*)parameter returnData:(void (^)(NSData * resultData,NSError * error))returnBlock{
    
    //请求队列管理者 单例创建形式 防止内存泄漏
    
    AFHTTPSessionManager * manager = [AFAppDotNetAPIClient sharedClient];
    
    //[manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    [manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        returnBlock(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        returnBlock(nil,error);
        
    }];
    
}

@end
