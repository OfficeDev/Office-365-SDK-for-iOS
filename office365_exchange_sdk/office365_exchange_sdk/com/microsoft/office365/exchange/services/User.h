//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface User : Entity	

@property NSString *DisplayName;
@property NSString *Alias;
@property NSString *MailboxGuid;

@end