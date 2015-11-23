//
//  HYHomeController.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYHomeController.h"

#import "UIBarButtonItem+Item.h"
#import "HYTitleButton.h"
#import "HYPopMenu.h"
#import "HYCover.h"
#import "HYOneViewController.h"

@interface HYHomeController()<HYCoverDelegate>

@property(nonatomic, weak)HYTitleButton *titleButton;

@property(nonatomic, strong)HYOneViewController *one;

@end

@implementation HYHomeController

-(HYOneViewController *)one
{
    if (_one == nil) {
        _one = [[HYOneViewController alloc] init];
    }
    return _one;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem.titleView removeFromSuperview];
    [self setUpNavigationBar];
    
}

-(void)setUpNavigationBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendsearch) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] highImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    HYTitleButton *titltButton = [HYTitleButton buttonWithType:UIButtonTypeCustom];
    _titleButton = titltButton;
    [titltButton setTitle:@"首页" forState:UIControlStateNormal];
    [titltButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [titltButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    titltButton.adjustsImageWhenHighlighted = NO;
    [titltButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titltButton;
    
}

-(void)titleClick:(UIButton *)butotn
{
    butotn.selected = !butotn.selected;
    HYCover *cover = [HYCover show];
    cover.delegate = self;
    
    CGFloat popW = 200;
    CGFloat popX = (self.view.width - 200)*0.5;
    CGFloat popH = popW;
    CGFloat popY = 55;
    HYPopMenu *menu = [HYPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
    
    menu.contentView = self.one.view;
    
}

-(void)coverDidClickCover:(HYCover *)cover
{
    [HYPopMenu hide];
    _titleButton.selected = NO;
}

- (void)friendsearch
{
    //    NSLog(@"%s",__func__);
}

- (void)pop
{
    //    [_titleButton setTitle:@"首页首页" forState:UIControlStateNormal];
    [_titleButton setImage:nil forState:UIControlStateNormal];
    //    [_titleButton sizeToFit];
}

@end





















