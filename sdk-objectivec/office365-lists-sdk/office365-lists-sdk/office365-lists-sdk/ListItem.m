//
//  ListItem.m
//  office365-lists-sdk
//
//  Created by Lagash on 8/13/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

- (NSString*) getTitle{
    return (NSString*)[self getData : @"Title"];
}

-(NSUUID*) getGuid{
    return (NSUUID*)[self getData: @"GUID"];
}

@end
