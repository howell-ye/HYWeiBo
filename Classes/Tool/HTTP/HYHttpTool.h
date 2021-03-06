//
//  HYHttpTool.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HYUploadParam;
@interface HYHttpTool : NSObject

+(void)GET:(NSString *)urlString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void (^)(NSError *error))failure;


+(void)POST:(NSString *)urlString parameters:(id)parameters success:(void(^)(id))success failure:(void(^)(NSError *))failure;

+(void)upload:(NSString *)urlString parameters:(id)parameters uploadParam:(HYUploadParam *)uploadParam success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
@end
