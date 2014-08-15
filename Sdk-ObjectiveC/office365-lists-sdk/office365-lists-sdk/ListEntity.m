//
//  ListEntity.m
//  office365-lists-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListEntity.h"

@interface ListEntity ()
    @property BOOL allowContentTypes;
    @property BOOL contentTypesEnabled;
    @property NSNumber* baseTemplate;
@end
/*
'_metadata':{'type':SP.List},
'AllowContentTypes': true,
'BaseTemplate': 104,
'ContentTypesEnabled': true,
'Description': 'My list description',
'Title': 'RestTest'
*/

@implementation ListEntity

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.allowContentTypes = TRUE;
        self.contentTypesEnabled = TRUE;
        self.baseTemplate = [[NSNumber alloc] initWithInt:104];
    }
    return self;
}

- (NSString*) getTitle{
    return (NSString*)[self getData : @"Title"];
}

@end
