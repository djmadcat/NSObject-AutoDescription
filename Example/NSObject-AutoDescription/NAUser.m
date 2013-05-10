//
//  NAUser.m
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 09.05.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//


#import "NAUser.h"
#import "NSObject+AutoDescription.h"


@implementation NAUser

+ (instancetype)user
{
	return [[self alloc] init];
}

- (NSString *)description
{
	return [self autoDescription];
}

@end
