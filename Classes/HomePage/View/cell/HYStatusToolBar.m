//
//  HYStatusToolBar.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/26.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYStatusToolBar.h"
#import "HYStatus.h"

@interface HYStatusToolBar()

@property(nonatomic, strong)NSMutableArray *btns;

@property(nonatomic, strong)NSMutableArray *divideVs;

@property(nonatomic, weak)UIButton *retweet;

@property(nonatomic, weak)UIButton *comment;

@property(nonatomic, weak)UIButton *unlike;

@end


@implementation HYStatusToolBar

-(NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

-(NSMutableArray *)divideVs
{
    if (_divideVs == nil) {
        _divideVs = [NSMutableArray array];
    }
    return _divideVs;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStretchableName:@"timeline_card_bottom_background"];
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    UIButton *retweet = [self setUpOneButtonWithTitle:@"转发" image:[UIImage imageNamed:@"timeline_icon_retweet"]];
    UIButton *comment = [self setUpOneButtonWithTitle:@"评论" image:[UIImage imageNamed:@"timeline_icon_comment"]];
    UIButton *unlike = [self setUpOneButtonWithTitle:@"赞" image:[UIImage imageNamed:@"timeline_icon_unlike"]];

    for (int i = 0; i < 2; i++) {
        UIImageView *divide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
        [self addSubview:divide];
        [self.divideVs addObject:divide];
    }
}

-(UIButton *)setUpOneButtonWithTitle:(NSString *)title image:(UIImage *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [self addSubview:btn];
    [self.btns addObject:btn];
    return  btn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = self.btns.count;
    CGFloat w = HYScreenW/count;
    CGFloat h = self.height;
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.btns[i];
        x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
    }
    int i = 0;
    for (UIImageView *divide in self.divideVs) {
        UIButton *btn = self.btns[i];
        divide.x = btn.x;
        i++;
    }
}

-(void)setStatus:(HYStatus *)status
{
    _status = status;
    [self setBtn:_retweet tittle:status.reposts_count];
    [self setBtn:_comment tittle:status.comments_count];
    [self setBtn:_unlike tittle:status.attitudes_count];
    
}

-(void)setBtn:(UIButton *)btn tittle:(int)count
{
    NSString *title = nil;
    if (count) {
        if (count > 10000) {
            CGFloat floatCount = count/10000.0;
            title = [NSString stringWithFormat:@"%.1fW",floatCount];
            title = [title stringByReplacingOccurrencesOfString:@".0" withString:@""];
        }else{
            title = [NSString stringWithFormat:@"%d",count];
        }
        [btn setTitle:title forState:UIControlStateNormal];
    }
}

@end



















