/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

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
