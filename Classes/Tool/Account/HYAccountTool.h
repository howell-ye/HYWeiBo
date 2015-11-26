//
//  HYAccountTool.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HYAccount;
@interface HYAccountTool : NSObject

+(void)saveAccount:(HYAccount *)account;

+(HYAccount *)account;

+(void)accountWithCode:(NSString *)code success:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
