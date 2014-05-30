//
//  ZHDAppDelegate.m
//  ZhihuDaily
//
//  Created by JiangXiaodong on 5/29/14.
//  Copyright (c) 2014 jxdwinter. All rights reserved.
//

#import "ZHDAppDelegate.h"

#import "ZHDViewController.h"
#import "ZHD_Controller_TopicViewController.h"
#import "ZHD_Controller_MyCollectionViewController.h"
#import "ZHD_Controller_SettingsViewController.h"

@implementation ZHDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    SDImageCache *imageCache = [SDImageCache sharedImageCache];
    [imageCache setMaxCacheSize:1024*1024*200];

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName:[ZHD_GlobalClass sharedTextColor],
                                                            NSFontAttributeName:[UIFont systemFontOfSize:18]}];

    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor:[ZHD_GlobalClass sharedTextColor]];

    [[UITabBar appearance] setTintColor:[ZHD_GlobalClass sharedColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8]];

    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.view.backgroundColor = [UIColor whiteColor];

    UINavigationController* vc = [[UINavigationController alloc] initWithRootViewController:[[ZHDViewController alloc] init]];
    UINavigationController* tc = [[UINavigationController alloc] initWithRootViewController:[[ZHD_Controller_TopicViewController alloc] init]];
    UINavigationController* mc = [[UINavigationController alloc] initWithRootViewController:[[ZHD_Controller_MyCollectionViewController alloc] init]];
    UINavigationController* st = [[UINavigationController alloc] initWithRootViewController:[[ZHD_Controller_SettingsViewController alloc] init]];

    NSArray* controllers = @[vc,tc,mc,st];
    self.tabBarController.viewControllers = controllers;

    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];


    tabBarItem1.image = [UIImage imageNamed:@"vc"] ;
    tabBarItem1.selectedImage = [UIImage imageNamed:@"vc_pre"];
    tabBarItem1.title = @"日报";

    tabBarItem2.image = [UIImage imageNamed:@"tc"];
    tabBarItem2.selectedImage = [UIImage imageNamed:@"tc_pre"];
    tabBarItem2.title = @"主题";

    tabBarItem3.image = [UIImage imageNamed:@"mc"];
    tabBarItem3.selectedImage = [UIImage imageNamed:@"mc_pre"];
    tabBarItem3.title = @"收藏";

    tabBarItem4.image = [UIImage imageNamed:@"st"];
    tabBarItem4.selectedImage = [UIImage imageNamed:@"st_pre"];
    tabBarItem4.title = @"设置";

    self.window.rootViewController = self.tabBarController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
