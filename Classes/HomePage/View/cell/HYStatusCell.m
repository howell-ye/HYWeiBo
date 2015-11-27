//
//  HYStatusCell.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/27.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYStatusCell.h"
#import "HYOriginalView.h"
#import "HYRetweetView.h"
#import "HYStatusToolBar.h"
#import "HYStatusFrame.h"

@interface HYStatusCell()

@property (nonatomic, weak) HYOriginalView *originalView;
@property (nonatomic, weak) HYRetweetView *retweetView ;
@property (nonatomic, weak) HYStatusToolBar *toolBar;

@end

@implementation HYStatusCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpAllChildView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


-(void)setUpAllChildView
{
    // 原创微博
    HYOriginalView *originalView = [[HYOriginalView alloc] init];
    [self addSubview:originalView];
    _originalView = originalView;
    
    // 转发微博
    HYRetweetView *retweetView = [[HYRetweetView alloc] init];
    [self addSubview:retweetView];
    _retweetView = retweetView;
    
    // 工具条
    HYStatusToolBar *toolBar = [[HYStatusToolBar alloc] init];
    [self addSubview:toolBar];
    _toolBar = toolBar;
}

-(void)setStstusF:(HYStatusFrame *)ststusF
{
    _statusF = ststusF;
    
    _originalView.frame = ststusF.originalViewFrame;
    _originalView.statusF = _statusF;
    
    _retweetView.frame = _statusF.retweetViewFrame;
    _retweetView.statusF = _statusF;
    
    _toolBar.frame = _statusF.toolBarFrame;
}

@end
