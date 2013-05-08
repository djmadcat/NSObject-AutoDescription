//
//  NSObject+AutoDescription.m
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 09.05.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//
//  Email:  mailto:djmadcat@gmail.com
//  Github: https://github.com/djmadcat
//


#import "NSObject+AutoDescription.h"
#import <objc/runtime.h>
#import "NSObject+CleanDescription.h"


@implementation NSObject (AutoDescription)

- (NSString *)autoDescription
{
	return [NSString stringWithFormat:@"<%@: %p; %@>", NSStringFromClass([self class]), self, [self keyValueAutoDescription]];
}

- (NSString *)keyValueAutoDescription
{
	NSMutableString *result = [NSMutableString string];

	dispatch_queue_t currentQueue = dispatch_get_current_queue();
	
	id associatedObject = objc_getAssociatedObject(self, currentQueue);
	if (associatedObject) {
		return @"(self)";
	}

	objc_setAssociatedObject(self, currentQueue, result, OBJC_ASSOCIATION_RETAIN);

	Class currentClass = [self class];
	while (currentClass != [NSObject class]) {
		unsigned int propertyListCount = 0;
		objc_property_t *propertyList = class_copyPropertyList(currentClass, &propertyListCount);
		for (int i = 0; i < propertyListCount; i++) {
			const char *property_name = property_getName(propertyList[i]);
			NSString *propertyName = [NSString stringWithCString:property_name encoding:NSASCIIStringEncoding];

			if (propertyName) {
				id propertyValue = [self valueForKey:propertyName];
				[result appendFormat:@"%@ = %@; ", propertyName, [propertyValue cleanDescription]];
			}
		}
		free(propertyList);
		currentClass = class_getSuperclass(currentClass);
	}
	NSUInteger length = [result length];
	if (length) {
		[result deleteCharactersInRange:NSMakeRange(length - 1, 1)];
	}

	objc_setAssociatedObject(self, currentQueue, nil, OBJC_ASSOCIATION_RETAIN);

	return result;
}

@end
