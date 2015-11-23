//
//  HYNavigationController.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/22.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYNavigationController.h"
#import "UIBarButtonItem+Item.h"
#import "HYTabBar.h"

@interface HYNavigationController()<UINavigationControllerDelegate>

@property(nonatomic, strong)id popDelegate;

@end


@implementation HYNavigationController

+(void)initialize
{
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *titltArr = [NSMutableDictionary dictionary];
    titltArr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:titltArr forState:UIControlStateNormal];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *left = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] highImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(popToPre) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = left;
        
        UIBarButtonItem *right = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(popToRoot) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.rightBarButtonItem = right;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)popToRoot
{
    [self popToRootViewControllerAnimated:YES];
}

-(void)popToPre
{
    [self popViewControllerAnimated:YES];
}


-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UITabBarController *tabbarVc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    for(UIView *tabBarButton in tabbarVc.tabBar.subviews)
    {
        if (![tabBarButton isKindOfClass:[HYTabBar class]]) {
            [tabBarButton removeFromSuperview];
        }
    }
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }else{
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }
}


@end


























