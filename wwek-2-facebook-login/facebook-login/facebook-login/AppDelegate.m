//
//  AppDelegate.m
//  facebook-login
//
//  Created by Scott Savarie on 6/18/14.
//  Copyright (c) 2014 Scott Savarie. All rights reserved.
//

#import "AppDelegate.h"
#import "loginViewController.h"
#import "requestsViewController.h"
#import "newsFeedViewController.h"
#import "messagesViewController.h"
#import "notificationsViewController.h"
#import "moreViewController.h"



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    // Set Root View Controller Login in
//    loginViewController *vc = [[loginViewController alloc] init];
//    self.window.rootViewController = vc;
    
    
    
    // Newsfeed View Controller / Nav controller
    newsFeedViewController *newsFeedVC = [[newsFeedViewController alloc] init];
    UINavigationController *newsfeedNavController = [[UINavigationController alloc] initWithRootViewController:newsFeedVC];
    newsfeedNavController.tabBarItem.title = @"NewsFeed";
    
    
    
    // Requests View Controller / Nav controller
    requestsViewController *requestVC = [[requestsViewController alloc] init];
    UINavigationController *requestNavController = [[UINavigationController alloc] initWithRootViewController:requestVC];
    requestNavController.tabBarItem.title = @"Requests";
    
    
    // Messages View Controller / Nav controller
    messagesViewController *messagesVC = [[messagesViewController alloc] init];
    UINavigationController *messagesNavController = [[UINavigationController alloc] initWithRootViewController:messagesVC];
    messagesNavController.tabBarItem.title = @"Messages";
    
    // Notifications View Controller / Nav controller
    notificationsViewController *notificationsVC = [[notificationsViewController alloc] init];
    UINavigationController *notificationsNavController = [[UINavigationController alloc] initWithRootViewController:notificationsVC];
    notificationsNavController.tabBarItem.title = @"Notifications";
    
    // More View Controller / Nav controller
    moreViewController *moreVC = [[moreViewController alloc] init];
    UINavigationController *moreNavController = [[UINavigationController alloc] initWithRootViewController:moreVC];
    moreNavController.tabBarItem.title = @"More";

    
    // Configure the tab bar controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[newsfeedNavController, requestNavController, messagesNavController, notificationsNavController, moreNavController];
    
    self.window.rootViewController = tabBarController;
    
    
    
    
    
    
    

    // Make status bar white
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
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
