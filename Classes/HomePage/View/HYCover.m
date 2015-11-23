//
//  HYCover.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYCover.h"

@implementation HYCover

-(void)setDimBackground:(BOOL)dimBackground
{
    _dimBackground = dimBackground;
    if (dimBackground) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
    }else{
        self.alpha = 1;
        self.backgroundColor = [UIColor clearColor];
    }
}

+(instancetype)show
{
    HYCover *cover = [[HYCover alloc]initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor clearColor];
    
    [HYKeyWindow addSubview:cover];
    return cover;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeFromSuperview];
    
    if ([_delegate respondsToSelector:@selector(coverDidClickCover:)]) {
        [_delegate coverDidClickCover:self];
    }
}

@end
