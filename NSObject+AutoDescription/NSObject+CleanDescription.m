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

	if ([self isKindOfClass:[NSString class]]) {
		NSString *zelf = (NSString *)self;

		if ([zelf rangeOfCharacterFromSet:[[NSCharacterSet alphanumericCharacterSet] invertedSet]].location == NSNotFound) {
			result = zelf;
		} else {
			result = [NSString stringWithFormat:@"\"%@\"", zelf];
		}
	} else if ([self isKindOfClass:[NSArray class]]) {
		NSArray *zelf = (NSArray *)self;

		NSMutableString *elements = [NSMutableString string];
		for (id value in zelf) {
			[elements appendFormat:@"%@, ", [value cleanDescription]];
		}
		NSUInteger length = [elements length];
		if (length > 2) {
			[elements deleteCharactersInRange:NSMakeRange(length - 2, 2)];
		}

		result = [NSString stringWithFormat:@"(%@)", elements];
	} else if ([self isKindOfClass:[NSDictionary class]]) {
		NSDictionary *zelf = (NSDictionary *)self;

		NSMutableString *elements = [NSMutableString string];
		for (id key in zelf) {
			id value = [zelf objectForKey:key];
			[elements appendFormat:@"%@ = %@; ", [key cleanDescription], [value cleanDescription]];
		}
		NSUInteger length = [elements length];
		if (length) {
			[elements deleteCharactersInRange:NSMakeRange(length - 1, 1)];
		}

		result = [NSString stringWithFormat:@"{%@}", elements];
	} else if ([self isKindOfClass:[NSSet class]]) {
		NSSet *zelf = (NSSet *)self;

		NSArray *allObjects = [zelf allObjects];

		result = [NSString stringWithFormat:@"{%@}", [allObjects cleanDescription]];
	} else {
		result = [self description];
	}

	return result;
}

@end
