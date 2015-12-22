//
//  HYPhotosView.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/30.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYPhotosView.h"
#import "HYPhoto.h"
#import "UIImageView+WebCache.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

#import "HYPhotoView.h"

@implementation HYPhotosView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpAllChildView];
    }
    return  self;
}

-(void)setUpAllChildView
{
    for (int i = 0; i < 9; i++) {
        HYPhotoView *imageV = [[HYPhotoView alloc] init];
        imageV.tag = i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [imageV addGestureRecognizer:tap];
        [self addSubview:imageV];
    }
}


-(void)tap:(UITapGestureRecognizer *)tap
{
    UIImageView *tapView = tap.view;
    int i = 0;
    NSMutableArray *arrM = [NSMutableArray array];
    for (HYPhoto *photo in _pic_urls) {
        MJPhoto *pho = [[MJPhoto alloc] init];
        NSString *urlStr = photo.thumbnail_pic.absoluteString;
        urlStr = [urlStr stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        pho.url = [NSURL URLWithString:urlStr];
        pho.index = i;
        pho.srcImageView = tapView;
        [arrM addObject:pho];
        i++;
    }
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.photos = arrM;
    browser.currentPhotoIndex = tapView.tag;
    [browser show];
    
}


-(void)setPic_urls:(NSArray *)pic_urls
{
    _pic_urls = pic_urls;
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        HYPhotoView *imageV = self.subviews[i];
        if (i < _pic_urls.count) {
            imageV.hidden = NO;
            HYPhoto *photo = _pic_urls[i];
            imageV.photo = photo;
        }else{
            imageV.hidden = YES;
        }
        
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 70;
    CGFloat h = 70;
    CGFloat margin = 10;
    int col = 0;
    int rol = 0;
    int cols = _pic_urls.count==4?2:3;
    for (int i = 0; i < _pic_urls.count; i++) {
        col = i % cols;
        rol = i / cols;
        UIImageView *imageV = self.subviews[i];
        x = col * (w + margin);
        y = rol * (h + margin);
        imageV.frame = CGRectMake(x, y, w, h);
    }
}

@end













