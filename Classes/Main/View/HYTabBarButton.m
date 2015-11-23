//
//  HYTabBarButton.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYTabBarButton.h"
#import "HYBadgeView.h"


@interface HYTabBarButton()

@property(nonatomic, weak)HYBadgeView *badgeView;

@end


@implementation HYTabBarButton

-(void)setHighlighted:(BOOL)highlighted
{
//取消系统自带的高亮之后的操作
}

-(HYBadgeView *)badgeView
{
    if (_badgeView == nil) {
        HYBadgeView *badgeBtn = [HYBadgeView buttonWithType:UIButtonTypeCustom];
        [self addSubview:badgeBtn];
        
        _badgeView = badgeBtn;
    }
    
    return _badgeView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return self;
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    //如何用KVO去监听一个对象的属性有没有变化
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    
    self.badgeView.badgeValue = _item.badgeValue;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * 0.7;
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleX = 0;
    CGFloat titleY = imageH-3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    self.badgeView.x = self.width - self.badgeView.width - 10;
    self.badgeView.y = 0;
}

@end

















