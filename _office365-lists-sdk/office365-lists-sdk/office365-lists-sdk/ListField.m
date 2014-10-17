//
//  ListField.m
//  office365-lists-sdk
//
//  Created by Lagash on 8/14/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListField.h"

@implementation ListField : BaseEntity
- (NSString*) getTitle{
    return (NSString*)[self getData : @"Title"];
}

- (NSString*) getPropertyName{
    return (NSString*)[self getData : @"Title"];
}
@end
