//
//  HYStatusTool.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYStatusTool.h"

#import "HYHttpTool.h"
#import "HYStatusResult.h"
#import "HYStatus.h"
#import "HYStatusParam.h"
#import "HYAccount.h"
#import "HYAccountTool.h"

#import "MJExtension.h"

@implementation HYStatusTool

+(void)newStatusWithSinceId:(NSString *)sinceId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    HYStatusParam *param = [[HYStatusParam alloc] init];
    param.access_token = [HYAccountTool account].access_token;
    if (sinceId) { // 有微博数据，才需要下拉刷新
        param.since_id = sinceId;
        
    }
    
    [HYHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.keyValues success:^(id responseObject) { // HttpTool请求成功的回调
        // 请求成功代码先保存
        
        HYStatusResult *result = [HYStatusResult objectWithKeyValues:responseObject];
        
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+(void)moreStatusWithMaxId:(NSString *)maxId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    HYStatusParam *param = [[HYStatusParam alloc] init];
    param.access_token = [HYAccountTool account].access_token;
    if (maxId) { // 有微博数据，才需要下拉刷新
        param.max_id = maxId;
        
    }
    
    [HYHttpTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.keyValues success:^(id responseObject) { //HttpTool请求成功的回调
        // 请求成功代码先保存
        
        // 把结果字典转换结果模型
        HYStatusResult *result = [HYStatusResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
