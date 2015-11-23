//
//  HYTabBar.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/19.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYTabBar;

@protocol HYTabBarDelegate <NSObject>

@optional

-(void)tabBar:(HYTabBar *)tabBar didClickButton:(NSInteger)index;

@end

@interface HYTabBar : UIView

@property(nonatomic, strong)NSArray *items;

@property(nonatomic, weak)id<HYTabBarDelegate>delegate;

@end
