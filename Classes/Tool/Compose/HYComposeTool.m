//
//  HYComposeTool.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/30.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYComposeTool.h"
#import "HYHttpTool.h"
#import "HYComposeParam.h"
#import "HYUploadParam.h"
#import "MJExtension.h"
#import "AFNetworking.h"


@implementation HYComposeTool

+(void)composeWithStatus:(NSString *)status success:(void (^)())success failure:(void (^)(NSError *))failure
{
    HYComposeParam *param = [HYComposeParam param];
    param.status = status;
    [HYHttpTool POST:@"https://api.weibo.com/2/statuses/update.json" parameters:param.keyValues success:^(id responseObject){
        if (success) {
            success();
        }
    } failure:^(NSError *error){
        if (failure) {
            failure(error);
        }
    }];
}


+(void)compoWithStatus:(NSString *)status image:(UIImage *)image success:(void (^)())success failure:(void (^)(NSError *))failure
{
    HYComposeParam *param = [HYComposeParam param];
    param.status = status;
    
    HYUploadParam *upLoad = [[HYUploadParam alloc] init];
    upLoad.data = UIImagePNGRepresentation(image);
    upLoad.name = @"pic";
    upLoad.fileName = @"image.png";
    upLoad.mimeType = @"image/png";
    
    [HYHttpTool upload:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:param uploadParam:upLoad success:^(id responseObject){
        if (success) {
            success();
        }
    } failure:^(NSError *error){
        if (failure) {
            failure(error);
        }
    }];
    
}


@end

















