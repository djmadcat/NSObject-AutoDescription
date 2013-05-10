//
//  NAGroup.h
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 09.05.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface NAGroup : NSObject

+ (instancetype)group;

@property (nonatomic, strong) NSNumber *groupID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSSet *users;

@end
