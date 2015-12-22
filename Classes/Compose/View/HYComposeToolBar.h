//
//  HYComposeToolBar.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/30.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYComposeToolBar;
@protocol HYComposeToolBarDelegate <NSObject>

@optional
-(void)composeToolBar:(HYComposeToolBar *)toolBar didClickBtn:(NSInteger)index;

@end

@interface HYComposeToolBar : UIView

@property(nonatomic, weak)id<HYComposeToolBarDelegate> delegate;

@end
