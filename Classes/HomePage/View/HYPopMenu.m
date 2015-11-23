//
//  HYPopMenu.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYPopMenu.h"


@implementation HYPopMenu

+(instancetype)showInRect:(CGRect)rect
{
    HYPopMenu *menu = [[HYPopMenu alloc] initWithFrame:rect];
    menu.userInteractionEnabled = YES;
    menu.image = [UIImage imageWithStretchableName:@"popover_background"];
    [HYKeyWindow addSubview:menu];
    return menu;
}

+(void)hide
{
    for(UIView *popMenu in HYKeyWindow.subviews){
        if ([popMenu isKindOfClass:self]) {
            [popMenu removeFromSuperview];
        }
    }
}

-(void)setContentView:(UIView *)contentView
{
    [_contentView removeFromSuperview];
    _contentView = contentView;
    contentView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:contentView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat y = 9;
    CGFloat margin = 5;
    CGFloat x = margin;
    CGFloat w = self.width - 2 * margin;
    CGFloat h = self.height - y - margin;
    
    _contentView.frame = CGRectMake(x, y, w, h);
}

@end
