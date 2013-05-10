//
//  NAGroup.m
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 09.05.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//


#import "NAGroup.h"
#import "NSObject+AutoDescription.h"


@implementation NAGroup

+ (instancetype)group
{
	return [[self alloc] init];
}

- (NSString *)description
{
	return [self autoDescription];
}

@end
