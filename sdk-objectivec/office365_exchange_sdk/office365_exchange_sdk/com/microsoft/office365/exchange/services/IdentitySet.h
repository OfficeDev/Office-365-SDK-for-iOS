//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

@class ApplicationInfo;
@class UserInfo;
@interface IdentitySet : NSObject	

@property ApplicationInfo *application;
@property UserInfo *user;

@end