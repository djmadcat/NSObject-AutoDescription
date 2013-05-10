//
//  NSObject+CleanDescription.m
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 09.05.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//
//  Email:  mailto:djmadcat@gmail.com
//  Github: https://github.com/djmadcat
//


#import "NSObject+CleanDescription.h"


@implementation NSObject (CleanDescription)

- (NSString *)cleanDescription
{
	NSString *result;
	result = [self description];
	return result;
}

@end


@implementation NSString (CleanDescription)

- (NSString *)cleanDescription
{
	NSString *result;

	if ([self rangeOfCharacterFromSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]].location == NSNotFound) {
		result = self;
	} else {
		result = [NSString stringWithFormat:@"\"%@\"", self];
	}

	return result;
}

@end


@implementation NSArray (CleanDescription)

- (NSString *)cleanDescription
{
	NSString *result;

	NSMutableString *elements = [NSMutableString string];
	for (id value in self) {
		[elements appendFormat:@"%@, ", [value cleanDescription]];
	}
	NSUInteger length = [elements length];
	if (length > 2) {
		[elements deleteCharactersInRange:NSMakeRange(length - 2, 2)];
	}

	result = [NSString stringWithFormat:@"(%@)", elements];

	return result;
}

@end


@implementation NSSet (CleanDescription)

- (NSString *)cleanDescription
{
	NSString *result;

	result = [NSString stringWithFormat:@"{%@}", [[self allObjects] cleanDescription]];

	return result;
}

@end


@implementation NSDictionary (CleanDescription)

- (NSString *)cleanDescription
{
	NSString *result;

	NSMutableString *elements = [NSMutableString string];
	for (id key in self) {
		id value = [self objectForKey:key];
		[elements appendFormat:@"%@ = %@; ", [key cleanDescription], [value cleanDescription]];
	}
	NSUInteger length = [elements length];
	if (length) {
		[elements deleteCharactersInRange:NSMakeRange(length - 1, 1)];
	}

	result = [NSString stringWithFormat:@"{%@}", elements];

	return result;
}

@end
