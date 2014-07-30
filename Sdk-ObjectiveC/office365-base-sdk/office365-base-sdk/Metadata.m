//
//  Metadata.m
//  office365-base-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "Metadata.h"

@implementation Metadata

- (instancetype)initWith:(NSDictionary *) data{
    
    self.Id = [data valueForKey:@"id"];
    self.Uri = [data valueForKey :@"uri"];
    self.type = [data valueForKey: @"type"];
    
    return self;
}

@end