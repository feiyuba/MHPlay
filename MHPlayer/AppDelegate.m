//
//  AppDelegate.m
//  MHPlayer
//
//  Created by 飞鱼 on 2017/12/28.
//  Copyright © 2017年 马浩. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "DiscoverVC.h"
#import "QRScanVC.h"
#import "MessageVC.h"
#import "MainVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    navi.tabBarItem.image =  [[UIImage imageNamed:@"首页"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi.tabBarItem.selectedImage = [[UIImage imageNamed:@"首页-颜色"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi.tabBarItem.title = @"首页";
    
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:[DiscoverVC new]];
    navi1.tabBarItem.image =  [[UIImage imageNamed:@"发现"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi1.tabBarItem.selectedImage = [[UIImage imageNamed:@"发现-颜色"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi1.tabBarItem.title = @"发现";
    
    UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:[QRScanVC new]];
    navi2.tabBarItem.image =  [[UIImage imageNamed:@"扫一扫"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi2.tabBarItem.selectedImage = [[UIImage imageNamed:@"扫一扫颜色"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *navi3 = [[UINavigationController alloc] initWithRootViewController:[MessageVC new]];
    navi3.tabBarItem.image =  [[UIImage imageNamed:@"消息"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi3.tabBarItem.title = @"消息";
    navi3.tabBarItem.selectedImage = [[UIImage imageNamed:@"消息-颜色"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *navi4 = [[UINavigationController alloc]initWithRootViewController:[MainVC new]];
    navi4.tabBarItem.image =  [[UIImage imageNamed:@"我的"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi4.tabBarItem.title = @"我的";
    navi4.tabBarItem.selectedImage = [[UIImage imageNamed:@"我的-颜色"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    tabbar.viewControllers = @[navi,navi1,navi2,navi3,navi4];
    
    self.window.rootViewController = tabbar;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
