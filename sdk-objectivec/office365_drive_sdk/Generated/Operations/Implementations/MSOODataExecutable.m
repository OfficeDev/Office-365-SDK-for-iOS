/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataExecutable.h"

/**
* The implementation file for type MSOODataExecutable.
*/

@implementation MSOODataExecutable

-(NSDictionary *)getCustomParameters{
    return self.CustomParameters;
}

-(void)addCustomParameters:(NSString *)name :(NSString *)value{
    NSDictionary* dicc = [[NSDictionary alloc] initWithObjectsAndKeys:value,name, nil];
    [self.CustomParameters addEntriesFromDictionary:dicc];
}
@end

