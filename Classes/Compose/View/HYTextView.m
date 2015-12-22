//
//  HYTextView.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/30.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYTextView.h"

@interface HYTextView()

@property(nonatomic ,weak)UILabel *placeHolderLabel;

@end

@implementation HYTextView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

-(UILabel *)placeHolderLabel
{
    if (_placeHolderLabel == nil) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        _placeHolderLabel = label;
    }
    return _placeHolderLabel;
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeHolderLabel.font = font;
    [self.placeHolderLabel sizeToFit];
}

-(void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder = placeHolder;
    self.placeHolderLabel.text = placeHolder;
    [self.placeHolderLabel sizeToFit];
}

-(void)setHidePlaceHolder:(BOOL)hidePlaceHolder
{
    _hidePlaceHolder = hidePlaceHolder;
    self.placeHolderLabel.hidden = hidePlaceHolder;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.placeHolderLabel.x = 5;
    self.placeHolderLabel.y = 8;
}



@end















