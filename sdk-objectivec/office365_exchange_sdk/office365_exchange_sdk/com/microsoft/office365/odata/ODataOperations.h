//
//  ODataOperations.h
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import "ODataExecutable.h"
#import <office365_odata_interfaces/DependencyResolver.h>

@interface ODataOperations : ODataExecutable

-(id)initWith : (NSString*) urlComponent : (ODataExecutable*) parent;

@end