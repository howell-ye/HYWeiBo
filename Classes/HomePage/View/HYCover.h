//
//  HYCover.h
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYCover;
@protocol HYCoverDelegate <NSObject>

@optional

-(void)coverDidClickCover:(HYCover *)cover;

@end



@interface HYCover : UIView

+(instancetype)show;

@property(nonatomic, assign)BOOL dimBackground;

@property(nonatomic, weak)id<HYCoverDelegate>delegate;

@end
