//
//  AFAppDotNetAPIClient.h
//  MHPlayer
//
//  Created by 飞鱼 on 2017/12/28.
//  Copyright © 2017年 马浩. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFAppDotNetAPIClient : AFHTTPSessionManager

+ (AFHTTPSessionManager*)defaultNetManager;

+ (void)GET:(NSString*)url parameters:(NSDictionary*)parameter returnData:(void (^)(NSData * resultData,NSError * error))returnBlock;

+ (void)POST:(NSString*)url parameters:(NSDictionary*)parameter returnData:(void (^)(NSData * resultData,NSError * error))returnBlock;

@end
