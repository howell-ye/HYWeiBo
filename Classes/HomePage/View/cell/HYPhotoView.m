//
//  HYPhotoView.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/30.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYPhotoView.h"
#import "UIImageView+WebCache.h"
#import "HYPhoto.h"

@interface HYPhotoView()

@property(nonatomic, weak)UIImageView *gifView;

@end

@implementation HYPhotoView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        UIImageView *gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
        [self addSubview:gifView];
        _gifView = gifView;
    }
    return self;
}

-(void)setPhoto:(HYPhoto *)photo
{
    _photo = photo;
    [self sd_setImageWithURL:photo.thumbnail_pic placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    NSString *urlStr = photo.thumbnail_pic.absoluteString;
    if ([urlStr hasSuffix:@".gif"]) {
        self.gifView.hidden = NO;
    }else{
        self.gifView.hidden = NO;
    }
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.x = self.width-self.gifView.width;
    self.gifView.y = self.height - self.gifView.height;
}

@end





















