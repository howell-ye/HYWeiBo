//
//  HYTabBar.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/19.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYTabBar.h"
#import "HYTabBarButton.h"

@interface HYTabBar()

@property(nonatomic,weak)UIButton *plusButton;

@property(nonatomic, strong)NSMutableArray *buttons;

@property(nonatomic, weak)UIButton *selectedButton;

@end

@implementation HYTabBar

-(NSMutableArray *)buttons
{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return  _buttons;
}

-(void)setItems:(NSArray *)items
{
    _items = items;
    for (UITabBarItem *item in _items) {
        HYTabBarButton *btn = [HYTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.item = item;
        btn.tag = self.buttons.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        if(btn.tag == 0){
            [self btnClick:btn];
        }
        [self addSubview:btn];
        [self.buttons addObject:btn];
    }
}


-(void)btnClick:(UIButton *)button
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    if ([_delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [_delegate tabBar:self didClickButton:button.tag];
    }
}



-(UIButton *)plusButton
{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        _plusButton = btn;
        [self addSubview:_plusButton];
    }
    return _plusButton;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    CGFloat btnW = w/(self.items.count+1);
    CGFloat btnH = self.bounds.size.height;
    
    int i = 0;
    
    for(UIView *tabBarButton in self.buttons){
            if(i == 2){
                i = 3;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i++;
        
    }
    
    self.plusButton.center = CGPointMake(w*0.5, h*0.5);
}



@end









