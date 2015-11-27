//
//  HYOriginalView.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/26.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYOriginalView.h"
#import "HYStatusFrame.h"
#import "HYStatus.h"

#import "UIImageView+WebCache.h"

@interface HYOriginalView()

// 头像
@property (nonatomic, weak) UIImageView *iconView;


// 昵称
@property (nonatomic, weak) UILabel *nameView;


// vip
@property (nonatomic, weak) UIImageView *vipView;


// 时间
@property (nonatomic, weak) UILabel *timeView;

// 来源
@property (nonatomic, weak) UILabel *sourceView;


// 正文
@property (nonatomic, weak) UILabel *textView;

@end

@implementation HYOriginalView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpaAllChildView];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableName:@"timeline_card_top_background"];
    }
    return self;
}

-(void)setUpaAllChildView
{
    // 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    _iconView = iconView;
    
    // 昵称
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = HYNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    // vip
    UIImageView *vipView = [[UIImageView alloc] init];
    [self addSubview:vipView];
    _vipView = vipView;
    
    // 时间
    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = HYTimeFont;
    timeView.textColor = [UIColor orangeColor];
    [self addSubview:timeView];
    _timeView = timeView;
    
    // 来源
    UILabel *sourceView = [[UILabel alloc] init];
    sourceView.font = HYSourceFont;
    [self addSubview:sourceView];
    _sourceView = sourceView;
    
    // 正文
    UILabel *textView = [[UILabel alloc] init];
    textView.font = HYTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
}

-(void)setStatusF:(HYStatusFrame *)statusF
{
    _statusF = statusF;
    [self setUpData];
    [self setUpFrame];
}

-(void)setUpData
{
    HYStatus *status = _statusF.status;
    //在网络下通过链接加载图片，先通过一个图片占位等待加载
    [_iconView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    //昵称
    if (status.user.vip) {
        _nameView.textColor = [UIColor redColor];
    }else{
        _nameView.textColor = [UIColor blackColor];
    }
    _nameView.text = status.user.name;
    
    // vip
    NSString *imageName = [NSString stringWithFormat:@"common_icon_membership_level%d",status.user.mbrank];
    UIImage *image = [UIImage imageNamed:imageName];
    
    _vipView.image = image;
    
    // 时间
    _timeView.text = status.created_at;
    
    // 来源
    
    _sourceView.text = status.source;
    
    // 正文
    _textView.text = status.text;
}

-(void)setUpFrame
{
    _iconView.frame = _statusF.originalIconFrame;
    
    // 昵称
    _nameView.frame = _statusF.originalNameFrame;
    
    // vip
    if (_statusF.status.user.vip) { // 是vip
        _vipView.hidden = NO;
        _vipView.frame = _statusF.originalVipFrame;
    }else{
        _vipView.hidden = YES;
    }
    // 时间
    _timeView.frame = _statusF.originalTimeFrame;
    
    // 来源
    _sourceView.frame = _statusF.originalSourceFrame;
    
    // 正文
    _textView.frame = _statusF.originalTextFrame;
}



@end

























