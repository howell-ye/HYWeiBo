//
//  HYMessageController.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYMessageController.h"

@implementation HYMessageController

-(void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *chat = [[UIBarButtonItem alloc] initWithTitle:@"发起聊天" style:UIBarButtonItemStyleBordered target:self action:@selector(chat)];
    self.navigationItem.rightBarButtonItem = chat;
}

-(void)chat
{
    NSLog(@"发起聊天");
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
