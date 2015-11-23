//
//  HYPopMenu.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYPopMenu : UIImageView

+(instancetype)showInRect:(CGRect)rect;

+(void)hide;

@property(nonatomic, weak)UIView *contentView;

@end
