//
//  GRAppDelegate.m
//  GitReference
//
//  Created by Joshua Howland on 5/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "GRAppDelegate.h"
<<<<<<< HEAD
#import "MainViewController.h"
=======
>>>>>>> 50e901e128324bd18fd2e98801d8897e3833af45

@implementation GRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
<<<<<<< HEAD
    
    MainViewController *viewController = [MainViewController new];
    self.window.rootViewController = viewController;
    
=======
>>>>>>> 50e901e128324bd18fd2e98801d8897e3833af45
    return YES;
}

@end
