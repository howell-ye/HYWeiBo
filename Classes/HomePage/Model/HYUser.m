//
//  HYUser.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYUser.h"

@implementation HYUser

-(void)setMbtype:(int)mbtype
{
    _mbtype = mbtype;
    _vip = mbtype > 2;
}

@end
