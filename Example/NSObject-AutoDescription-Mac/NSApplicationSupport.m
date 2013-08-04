//
//  NSApplicationSupport.m
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 04.08.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//


#import "NSApplicationSupport.h"


int NSApplicationMainExt(int argc, const char *argv[], NSString *principalClassName, NSString *delegateClassName)
{
	Class principalClass = nil;
	Class delegateClass = nil;

	NSBundle *mainBundle = [NSBundle mainBundle];
	NSDictionary *infoDictionary = [mainBundle infoDictionary];

	if (![principalClassName length]) {
		principalClassName = [infoDictionary objectForKey:@"NSPrincipalClass"];
	}
	if ([principalClassName length]) {
		principalClass = NSClassFromString(principalClassName);
	} else {
		principalClass = [NSApplication class];
	}

	if ([delegateClassName length]) {
		delegateClass = NSClassFromString(delegateClassName);
	}

	NSCAssert([principalClass respondsToSelector:@selector(sharedApplication)],
			 @"Principal class must implement sharedApplication.");
	NSApplication *application = [principalClass sharedApplication];

	id<NSApplicationDelegate> delegate = [[delegateClass alloc] init];
	[application setDelegate:delegate];

	NSString *mainNibName = [infoDictionary objectForKey:@"NSMainNibFile"];
	NSNib *mainNib = [[NSNib alloc] initWithNibNamed:mainNibName bundle:mainBundle];
	[mainNib instantiateNibWithOwner:application topLevelObjects:nil];
	
	[application run];

	return 0;
}
