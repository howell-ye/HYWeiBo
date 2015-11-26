//
//  HYBaseParam.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/25.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYBaseParam : NSObject

@property (nonatomic, copy) NSString *access_token;

+ (instancetype)param;

@end
