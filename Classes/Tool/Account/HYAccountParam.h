//
//  HYAccountParam.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/25.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYAccountParam : NSObject

@property(nonatomic,copy)NSString *client_id;

@property(nonatomic,copy)NSString *client_secret;

@property(nonatomic, copy)NSString *grant_type;

@property(nonatomic,copy)NSString *code;

@property(nonatomic,copy)NSString *redirect_uri;

@end
