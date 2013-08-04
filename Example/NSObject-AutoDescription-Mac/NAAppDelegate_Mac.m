//
//  NAAppDelegate_Mac.m
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 04.08.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//


#import "NAAppDelegate_Mac.h"
#import "NAMain.h"


@implementation NAAppDelegate_Mac

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
	[NAMain main];

	[[NSApplication sharedApplication] terminate:self];
}

@end
