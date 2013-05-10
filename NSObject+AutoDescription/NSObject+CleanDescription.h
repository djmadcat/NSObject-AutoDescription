//
//  NSObject+CleanDescription.h
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 09.05.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//
//  Email:  mailto:djmadcat@gmail.com
//  Github: https://github.com/djmadcat
//


#import <Foundation/Foundation.h>


@interface NSObject (CleanDescription)

- (NSString *)cleanDescription;

@end


@interface NSString (CleanDescription)

- (NSString *)cleanDescription;

@end


@interface NSArray (CleanDescription)

- (NSString *)cleanDescription;

@end


@interface NSSet (CleanDescription)

- (NSString *)cleanDescription;

@end


@interface NSDictionary (CleanDescription)

- (NSString *)cleanDescription;

@end
