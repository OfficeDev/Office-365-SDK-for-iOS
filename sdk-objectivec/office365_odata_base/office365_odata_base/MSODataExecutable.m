//
//  MSODataExecutable.m
//  office365_odata_base
//
//  Created by Gustavo on 11/27/14.
//  Copyright (c) 2014 Microsoft Open Technologies, Inc. All rights reserved.
//

#import "MSODataExecutable.h"

@implementation MSODataExecutable

-(NSDictionary *)getCustomParameters{
    return self.CustomParameters;
}

-(void)addCustomParameters:(NSString *)name withValue:(NSString *)value{
    NSDictionary* dicc = [[NSDictionary alloc] initWithObjectsAndKeys:value,name, nil];
    [self.CustomParameters addEntriesFromDictionary:dicc];
}

@end