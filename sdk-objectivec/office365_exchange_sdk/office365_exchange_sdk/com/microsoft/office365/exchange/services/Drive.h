//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

@class UserInfo;
@class DriveQuota;
@interface Drive : NSObject	

@property NSString *id;
@property UserInfo *owner;
@property DriveQuota *quota;

@end