//
//  HYAccountTool.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYAccountTool.h"
#import "HYAccount.h"
#import "HYAccountParam.h"
#import "AFNetworking.h"
#import "HYHttpTool.h"
#import "MJExtension.h"

#define HYAccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

#define HYAuthorizeBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define HYClient_id @"2389394849" //@"3098401846"
#define HYRedirect_uri @"http://www.baidu.com"
#define HYClient_secret @"03729d16a4cd277c7da26398f7a01282" //@"21d0d509fa64972f734fe6b90486f0ac"

@implementation HYAccountTool

// 类方法一般用静态变量代替成员属性
static HYAccount *_account;

+(void)saveAccount:(HYAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:HYAccountFileName];
}

+(HYAccount *)account
{
    if (_account == nil) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:HYAccountFileName];
        if ([[NSDate date] compare:_account.expires_date]!=NSOrderedAscending) {
            return nil;
        }
    }
    return _account;
}


+(void)accountWithCode:(NSString *)code success:(void (^)())success failure:(void (^)(NSError *))failure
{
    HYAccountParam *param = [[HYAccountParam alloc] init];
    param.client_id = HYClient_id;
    param.client_secret = HYClient_secret;
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri = HYRedirect_uri;
    
    [HYHttpTool POST:@"https://api.weibo.com/oauth2/access_token" parameters:param success:^(id responseObject){
        HYAccount *account = [HYAccount accountWithDict:responseObject];
        [HYAccountTool saveAccount:account];
    } failure:^(NSError *error){
        if (failure) {
            failure(error);
        }
    }];
}

@end





















