//
//  HYUserTool.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/25.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYUserTool.h"
#import "HYUserParam.h"
#import "HYUserResult.h"
#import "HYAccount.h"
#import "HYAccountTool.h"
#import "HYHttpTool.h"
#import "MJExtension.h"
#import "HYUser.h"

@implementation HYUserTool

+ (void)unreadWithSuccess:(void (^)(HYUserResult *))success failure:(void (^)(NSError *))failure
{
    
    // 创建参数模型
    HYUserParam *param = [HYUserParam param];
    param.uid = [HYAccountTool account].uid;
    
    [HYHttpTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:param.keyValues success:^(id responseObject) {
        
        // 字典转换模型
        HYUserResult *result = [HYUserResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
}

+(void)userInfoWithSuccess:(void (^)(HYUser *))success failure:(void (^)(NSError *))failure
{
    HYUserParam *param = [HYUserParam param];
    param.uid = [HYAccountTool account].uid;
    [HYHttpTool GET:@"https://api.weibo.com/2/users/show.json" parameters:param.keyValues success:^(id responseObject){
        HYUser *user = [HYUser objectWithKeyValues:responseObject];
        if (success) {
            success(user);
        }
    } failure:^(NSError *error){
        if (failure) {
            failure(error);
        }
    }];
}

@end

















