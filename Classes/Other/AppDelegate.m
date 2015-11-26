//
//  AppDelegate.m
//  HYWeiBo
//
//  Created by yehowell on 15/11/18.
//  Copyright (c) 2015年 yehowell. All rights reserved.
//

#import "AppDelegate.h"

#import "HYHomeController.h"
#import "HYOAuthViewController.h"

#import "HYAccountTool.h"
#import "HYRootTool.h"

#import <AVFoundation/AVFoundation.h>
#import "UIImageView+WebCache.h"

@interface AppDelegate ()

@property(nonatomic, strong)AVAudioPlayer *player;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    
    [application registerUserNotificationSettings:setting];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    AVAudioSession *session = [AVAudioSession sharedInstance];

    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [session setCategory:AVAudioSessionCategoryAmbient error:nil];
    [session setActive:YES error:nil];
    
    if ([HYAccountTool account]) {
        [HYRootTool chooseRootViewController:self.window];
    }else{
        HYOAuthViewController *oauthVc = [[HYOAuthViewController alloc] init];
        self.window.rootViewController = oauthVc;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    [[SDWebImageManager sharedManager] cancelAll];
    [[SDWebImageManager sharedManager].imageCache clearMemory];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"silence.mp3" withExtension:nil] ;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    player.numberOfLoops = 1;
    [player play];
    _player = player;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    UIBackgroundTaskIdentifier ID = [application beginBackgroundTaskWithExpirationHandler:^{
        [application endBackgroundTask:ID];
    }];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
