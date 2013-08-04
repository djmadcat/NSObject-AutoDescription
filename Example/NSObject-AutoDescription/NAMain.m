//
//  NAMain.m
//  NSObject-AutoDescription
//
//  Created by Alexey Aleshkov on 04.08.13.
//  Copyright (c) 2013 Alexey Aleshkov. All rights reserved.
//


#import "NAMain.h"


@implementation NAMain

+ (void)main
{
	NAUser *user = [NAUser user];
	user.userID = @16;
	user.firstName = @"Hans";
	user.lastName = @"Schneider";
	user.login = @"user333";
	user.email = @"h.schneider@datas.com";

	NASuperUser *superUser = [NASuperUser user];
	superUser.userID = @12;
	superUser.firstName = @"Super";
	superUser.lastName = @"User";
	superUser.login = @"admin";
	superUser.email = @"admin@localhost";
	superUser.scope = [NSSet setWithArray:@[@"post.add", @"post.edit", @"post.delete", @[@"123", @"123"]]];
	superUser.connections = @{@"twitter":@"someadmin", @"facebook":@"someadmin", @"other":@{@"another_social_network":@"someadmin"}};
	superUser.manager = superUser;

	NAGroup *group = [NAGroup group];
	group.groupID = @22;
	group.name = @"admins";
	group.users = [NSSet setWithArray:@[user, superUser]];

	user.groups = [NSSet setWithArray:@[group]];
	superUser.groups = [NSSet setWithArray:@[group]];

	NSLog(@"NASuperUser instance description: %@", superUser);

	NSLog(@"nil is %@", nil);
	NSLog(@"NSNull is %@", [NSNull null]);
	NSLog(@"Recursive self for enclosed context is (self)");
}

@end
