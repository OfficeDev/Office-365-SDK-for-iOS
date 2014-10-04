//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

@class ItemReference;
@interface ItemUpdateInformation : NSObject	

@property NSString *name;
@property ItemReference *parentInfo;

@end