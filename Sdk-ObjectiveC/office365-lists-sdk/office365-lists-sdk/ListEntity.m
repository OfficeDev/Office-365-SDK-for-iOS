//
//  ListEntity.m
//  office365-lists-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListEntity.h"

@implementation ListEntity

- (BaseEntity *)createFromJson:(NSDictionary *)data{
    
    NSDictionary* metadata = [data valueForKey : @"__metadata"];
    
    [super createMetadata : metadata];
    
    self.Id = [data valueForKey : @"Id"];
    self.Title = [data valueForKey : @"Title"];
    
    return self;
}

@end
