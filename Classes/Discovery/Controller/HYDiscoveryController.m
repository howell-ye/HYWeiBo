//
//  HYDiscoveryController.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYDiscoveryController.h"
#import "HYSearchBar.h"

@implementation HYDiscoveryController

-(void)viewDidLoad
{
    [super viewDidLoad];
    HYSearchBar *searchBar = [[HYSearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35)];
    searchBar.placeholder = @"大家都在搜";
    self.navigationItem.titleView = searchBar;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

@end
