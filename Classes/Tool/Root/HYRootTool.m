//
//  HYRootTool.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/24.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "HYRootTool.h"
#import "HYTabViewController.h"
#import "HYNewFeatureController.h"


#define HYVersionKey @"version"

@implementation HYRootTool

+(void)chooseRootViewController:(UIWindow *)window
{
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:HYVersionKey];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        HYTabViewController *tabBarVc = [[HYTabViewController alloc] init];
        
        window.rootViewController = tabBarVc;
    }else{
        HYNewFeatureController *vc = [[HYNewFeatureController alloc] init];
        window.rootViewController = vc;
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:HYVersionKey];
    }
}


@end
