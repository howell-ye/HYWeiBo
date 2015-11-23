//
//  HYTabViewController.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/19.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYTabViewController.h"
#import "HYTabBar.h"


#import "HYHomeController.h"
#import "HYMessageController.h"
#import "HYProfileController.h"
#import "HYDiscoveryController.h"

#import "HYNavigationController.h"


@interface HYTabViewController ()<HYTabBarDelegate>

@property(nonatomic, strong)NSMutableArray *items;

@property(nonatomic, weak)HYHomeController *home;

@end

@implementation HYTabViewController

-(NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return  _items;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildViewController];
    
    [self setUpTabBar];
    
    
}

-(void)setUpTabBar
{
    HYTabBar *tabBar = [[HYTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.delegate = self;
    tabBar.items = self.items;
    [self.view addSubview:tabBar];
    [self.tabBar removeFromSuperview];
}


-(void)tabBar:(UITabBar *)tabBar didClickButton:(NSInteger)index
{
    self.selectedIndex = index;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


-(void)setUpAllChildViewController
{
    HYHomeController *home = [[HYHomeController alloc] init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_home_selected"] title:@"首页"];
    _home = home;
    
    HYMessageController *message = [[HYMessageController alloc] init];
    [self setUpOneChildViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_message_center_selected"] title:@"消息"];
    
    HYDiscoveryController *discovery = [[HYDiscoveryController alloc] init];
    [self setUpOneChildViewController:discovery image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_discover_selected"] title:@"发现"];
    
    HYProfileController *profile = [[HYProfileController alloc] init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageWithOriginalName:@"tabbar_profile_selected"] title:@"我"];
    
}

-(void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.title = title;
    vc.tabBarItem.image = image;
    //vc.tabBarItem.badgeValue = @"1";
    vc.tabBarItem.selectedImage = selectedImage;
    
    [self.items addObject:vc.tabBarItem];
    
    HYNavigationController *nav = [[HYNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}





@end
