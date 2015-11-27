//
//  HYStatusToolBar.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/26.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYStatusToolBar.h"

@implementation HYStatusToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 添加所有子控件
        [self setUpAllChildView];
        
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    
}

@end
