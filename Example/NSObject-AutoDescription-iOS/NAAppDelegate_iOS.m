//
//  NAAppDelegate_iOS.m
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 08.05.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//


#import "NAAppDelegate_iOS.h"
#import "NAMain.h"


@implementation NAAppDelegate_iOS

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	// Override point for customization after application launch.
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];

	[NAMain main];

	return YES;
}

@end
