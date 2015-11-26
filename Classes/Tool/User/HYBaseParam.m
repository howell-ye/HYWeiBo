//
//  HYBaseParam.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/25.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYBaseParam.h"
#import "HYAccountTool.h"
#import "HYAccount.h"

@implementation HYBaseParam

+ (instancetype)param
{
    HYBaseParam *param = [[self alloc] init];
    
    param.access_token = [HYAccountTool account].access_token;
    
    return param;
}

@end
