//
//  WTCAppDelegate.m
//  Storyboard
//
//  Created by wangtao on 14-1-8.
//  Copyright (c) 2014年 wangtao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCAppDelegate.h"
#import "WTCPlayer.h"
#import "WTCPlayersViewController.h"
#import "WTCSecondViewController.h"

@implementation WTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSLog(@"didFinishLaunchingWithOptions");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.view.frame = self.window.frame;

    UINavigationController *firstViewContoller = [[UINavigationController alloc] init];
    
    WTCPlayersViewController *navigationController = [[WTCPlayersViewController alloc] init];
    navigationController.players = self.players;
    WTCSecondViewController *secondViewController = [[WTCSecondViewController alloc] init];
    secondViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Gestures" image:[UIImage imageNamed:@"Gestures"]tag:0];
    
    WTCSecondViewController *thirdViewController = [[WTCSecondViewController alloc] init];
    thirdViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Others" image:[UIImage imageNamed:@"Gestures"]tag:0];
    
    firstViewContoller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Players" image:[UIImage imageNamed:@"Players"] tag:0];
    firstViewContoller.viewControllers = @[navigationController];
    tabBarController.viewControllers = @[firstViewContoller, secondViewController, thirdViewController];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"applicationDidBecomeActive");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    NSLog(@"openURL");
    NSLog(@"url=%@", url);
    if ([[url scheme] isEqualToString:@"storyboard"]) {
        NSLog(@"可以调用本程序");
        NSString *query = [url query];
        NSLog(@"query=%@", query);
        NSString *absoluteString = [url absoluteString];
        NSLog(@"absoluteString=%@", absoluteString);
        NSString *path = [url path];
        NSLog(@"path=%@", path);
        NSString *parameterString = [url parameterString];
        NSLog(@"parameterString=%@", parameterString);
        NSString *host = [url host];
        NSLog(@"host=%@", host);
        NSString *fragment = [url fragment];
        NSLog(@"fragment=%@", fragment);
        NSArray *array = [query componentsSeparatedByString:@"&"];
        
        self.players = [[NSMutableArray alloc] initWithCapacity:20];
        
        WTCPlayer *obtainPlayer = [[WTCPlayer alloc] init];
        for (NSString *item in array) {
            NSArray *itemArray = [item componentsSeparatedByString:@"="];
            [obtainPlayer setValue:[itemArray objectAtIndex:1] forKey:[itemArray objectAtIndex:0]];
        }
        [self.players addObject:obtainPlayer];
        
        WTCPlayer *player = [[WTCPlayer alloc] init];
        player.name = @"Bill Evans";
        player.game = @"Tic-Tac-Toe";
        player.rating = 4;
        [self.players addObject:player];
        
        player = [[WTCPlayer alloc] init];
        player.name = @"Oscar Peterson";
        player.game = @"Spin the Bottle";
        player.rating = 5;
        [self.players addObject:player];
        
        player = [[WTCPlayer alloc] init];
        player.name = @"Dave Brubeck";
        player.game = @"Texas Hold’em Poker";
        player.rating = 2;
        [self.players addObject:player];
        
        [self application:application didFinishLaunchingWithOptions:nil];
        return YES;
    }
    return NO;
}

@end
