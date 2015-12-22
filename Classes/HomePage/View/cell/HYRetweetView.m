//
//  HYRetweetView.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/26.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYRetweetView.h"

#import "HYStatus.h"
#import "HYStatusFrame.h"
#import "HYPhotosView.h"

@interface HYRetweetView()

// 昵称
@property (nonatomic, weak) UILabel *nameView;


// 正文
@property (nonatomic, weak) UILabel *textView;

@property (nonatomic, weak)HYPhotosView *photoView;

@end

@implementation HYRetweetView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableName:@"timeline_retweet_background"];
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    
    // 昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = HYNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    
    // 正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = HYTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
    
    //配图
    HYPhotosView *photoView  = [[HYPhotosView alloc] init];
    [self addSubview:photoView];
    _photoView = photoView;
}

- (void)setStatusF:(HYStatusFrame *)statusF
{
    _statusF = statusF;
    
    
    HYStatus *status = statusF.status;
    // 昵称
    _nameView.frame = statusF.retweetNameFrame;
    _nameView.text = status.retweeded_status.user.name;
    
    // 正文
    _textView.frame = statusF.retweetTextFrame;
    _textView.text = status.retweeded_status.text;
    
    _photoView.frame = statusF.retweetPhotosFrame;
    _photoView.pic_urls = status.retweeded_status.pic_urls;
}


@end
