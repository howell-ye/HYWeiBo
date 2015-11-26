//
//  HYUserTool.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/25.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HYUserResult,HYUser;
@interface HYUserTool : NSObject

+ (void)unreadWithSuccess:(void(^)(HYUserResult *result))success failure:(void(^)(NSError *error))failure;

+(void)userInfoWithSuccess:(void(^)(HYUser *user))success failure:(void(^)(NSError *error))failure;

@end
