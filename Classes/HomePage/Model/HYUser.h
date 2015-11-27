//
//  HYUser.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYUser : NSObject

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSURL *profile_image_url;

@property(nonatomic, assign)int mbtype;

@property(nonatomic, assign)int mbrank;

@property(nonatomic,assign ,getter=isVip)BOOL vip;

@end
