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


#import "HYStatus.h"
#import "HYStatusTool.h"
#import "HYUser.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "HYUserTool.h"

#import "HYAccount.h"
#import "HYAccountTool.h"

@interface HYHomeController()<HYCoverDelegate>

@property(nonatomic, weak)HYTitleButton *titleButton;

@property(nonatomic, strong)HYOneViewController *one;

@property(nonatomic, strong)NSMutableArray *statuses;

@end

@implementation HYHomeController

-(NSMutableArray *)statuses
{
    if (_statuses == nil) {
        _statuses = [NSMutableArray array];
    }
    return _statuses;
}

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
//    [self.navigationItem.titleView removeFromSuperview];
    [self setUpNavigationBar];
    
    [self.tableView addHeaderWithTarget:self action:@selector(loadMoreStatus)];
    
    [self.tableView headerBeginRefreshing];
    
    [self.tableView addFooterWithTarget:self action:@selector(loadNewStatus)];
//    self.tableView.tableFooterView = [[UIView alloc] init];;
    [HYUserTool userInfoWithSuccess:^(HYUser *user){
        [self.titleButton setTitle:user.name forState:UIControlStateNormal];
        HYAccount *account = [HYAccountTool account];
        account.name = user.name;
        [HYAccountTool saveAccount:account];
        
    } failure:^(NSError *error){
    
    }];
}

-(void)loadNewStatus
{
    NSString *sinceId = nil;
    if (self.statuses.count) { // 有微博数据，才需要下拉刷新
        
        sinceId = [self.statuses[0] idstr];
    }
    [HYStatusTool newStatusWithSinceId:sinceId success:^(NSArray *statuses){
        [self showNewStatusCount:statuses.count];
        
        [self.tableView headerEndRefreshing];
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, statuses.count)];
        // 把最新的微博数插入到最前面
        [self.statuses insertObjects:statuses atIndexes:indexSet];
        
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(NSError *error){
    
    }];
    
}

-(void)loadMoreStatus
{
    NSString *maxIdStr = nil;
    if (self.statuses.count) {
        long long maxId = [[[self.statuses lastObject] idstr] longLongValue]-1;
        maxIdStr = [NSString stringWithFormat:@"%lld",maxId];
    }
    
    [HYStatusTool moreStatusWithMaxId:maxIdStr success:^(NSArray *statuses){
        // 结束上拉刷新
        [self.tableView footerEndRefreshing];
        
        // 把数组中的元素添加进去
        [self.statuses addObjectsFromArray:statuses];
        
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(NSError *error){
    
    }];
}


-(void)showNewStatusCount:(NSInteger)count
{
    if (count == 0) {
        return;
    }
    CGFloat h = 35;
    CGFloat y = CGRectGetMaxY(self.navigationController.navigationBar.frame)-h;
    CGFloat x = 0;
    CGFloat w = self.view.width;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.textColor = [UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"最新微博数%ld",(long)count];
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    [UIView animateWithDuration:0.25 animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, h);
    }completion:^(BOOL finished){
        [UIView animateWithDuration:0.25 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
            label.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished){
            [label removeFromSuperview];
        
        }];
        
    }];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    HYStatus *status = self.statuses[indexPath.row];
    cell.textLabel.text = status.user.name;
    [cell.imageView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    cell.detailTextLabel.text = status.text;
    return cell;
}


@end





















