/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"

@implementation MSODataExecutable

-(NSDictionary *)getCustomParameters{
    return self.CustomParameters;
}

-(id<MSODataExecutable>)addCustomHeaderWithName:(NSString *)name andValue :(NSString *)value{
    NSDictionary* dicc = [[NSDictionary alloc] initWithObjectsAndKeys:value, name, nil];
    [self.CustomHeaders addEntriesFromDictionary:dicc];
    return self;
}

-(NSDictionary *)getCustomHeaders{
    return self.CustomHeaders;
}

@end