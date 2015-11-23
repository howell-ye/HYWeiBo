//
//  HYSearchBar.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/23.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYSearchBar.h"

@implementation HYSearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:13];
        self.background = [UIImage imageWithStretchableName:@"searchbar_textfield_background"];
        UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        imageV.width += 10;
        imageV.contentMode = UIViewContentModeCenter;
        self.leftView = imageV;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

@end
