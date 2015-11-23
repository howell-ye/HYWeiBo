//
//  HYBadgeView.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYBadgeView.h"


@implementation HYBadgeView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self sizeToFit];
    }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    if(badgeValue.length == 0||[badgeValue isEqual:@"0"]){
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
    //到时改掉这个已经要丢弃的函数
    CGSize size = [badgeValue sizeWithFont:[UIFont systemFontOfSize:11]];
    if (size.width > self.width) {
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
}

@end
























