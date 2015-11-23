//
//  HYProfileController.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYProfileController.h"

@implementation HYProfileController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *Setting = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:self action:@selector(setting)];
    
    self.navigationItem.rightBarButtonItem = Setting;
}

-(void)setting
{
    NSLog(@"设置");
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
