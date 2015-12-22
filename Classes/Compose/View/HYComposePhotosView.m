//
//  HYComposePhotosView.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/30.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYComposePhotosView.h"

@implementation HYComposePhotosView

-(void)setImage:(UIImage *)image
{
    _image = image;
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    [self addSubview:imageView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger cols = 3;
    CGFloat marign = 10;
    CGFloat wh = (self.width - (cols - 1) * marign) / cols;
    
    CGFloat x = 0;
    CGFloat y = 0;
    NSInteger col = 0;
    NSInteger row = 0;
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIImageView *imageV = self.subviews[i];
        col = i % cols;
        row = i / cols;
        x = col * (marign + wh);
        y = row * (marign + wh);
        imageV.frame = CGRectMake(x, y, wh, wh);
    }
}

@end




















