//
//  main.m
//  NSObject-AutoDescription-Mac
//
//  Created by Alexey Aleshkov on 04.08.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//


#import "NSApplicationSupport.h"
#import "NAAppDelegate_Mac.h"


int main(int argc, const char * argv[])
{
	@autoreleasepool {
		return NSApplicationMainExt(argc, argv, nil, NSStringFromClass([NAAppDelegate_Mac class]));
	}
}
