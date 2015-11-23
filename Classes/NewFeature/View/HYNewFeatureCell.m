//
//  HYNewFeatureCell.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/23.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYNewFeatureCell.h"
#import "HYTabViewController.h"

@interface HYNewFeatureCell()

@property(nonatomic, weak)UIImageView *imageView;

@property(nonatomic, weak)UIButton *shareButton;

@property(nonatomic, weak)UIButton *startButton;

@end


@implementation HYNewFeatureCell

-(UIButton *)shareButton
{
    if (_shareButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"分享给大家" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        [self.contentView addSubview:btn];
        
        _shareButton = btn;
    }
    return _shareButton;
}

-(UIButton *)startButton
{
    if (_startButton == nil) {
        UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];
        [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [startBtn sizeToFit];
        [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:startBtn];
        _startButton = startBtn;
        
    }
    return _startButton;
}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        _imageView = imageV;
        [self.contentView addSubview:imageV];
    }
    return _imageView;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    self.shareButton.center = CGPointMake(self.width * 0.5, self.height * 0.8);
    self.startButton.center = CGPointMake(self.width * 0.5, self.height * 0.9);
}

-(void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

-(void)setIndexPath:(NSIndexPath *)indexPath count:(int)count
{
    if (indexPath.row == count - 1) {
        self.shareButton.hidden = NO;
        self.startButton.hidden = NO;
    }else{
        self.shareButton.hidden = YES;
        self.startButton.hidden = YES;
    }
}

-(void)start
{
    HYTabViewController *tabBarVC = [[HYTabViewController alloc] init];
    HYKeyWindow.rootViewController = tabBarVC;
}


@end





















