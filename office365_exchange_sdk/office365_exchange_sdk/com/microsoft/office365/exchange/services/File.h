//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Item.h"

@interface File : Item	

-(id<File>)getOperations;

@property id<File> Operations;
@property NSString *contentUrl;

@end