//
//  NAUser.h
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 09.05.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface NAUser : NSObject

+ (instancetype)user;

@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, copy) NSString *login;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, strong) NSDictionary *connections;
@property (nonatomic, strong) NSSet *groups;
@property (nonatomic, strong) NAUser *manager;

@end
