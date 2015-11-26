//
//  HYHttpTool.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYHttpTool.h"
#import "AFNetworking.h"

@implementation HYHttpTool

+(void)GET:(NSString *)urlString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         if (failure) {
             failure(error);
         }
     }];
}

+(void)POST:(NSString *)urlString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        if (failure) {
            failure(error);
        }
    }];
}

@end
