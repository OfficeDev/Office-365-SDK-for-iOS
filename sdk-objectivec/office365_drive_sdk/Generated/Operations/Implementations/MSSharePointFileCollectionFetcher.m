/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSSharePointFileCollectionFetcher.h"

/**
* The implementation file for type MSSharePointFileCollectionFetcher.
*/

@implementation MSSharePointFileCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent;{
    return [super initWith:urlComponent :parent : [MSSharePointFile class]];
}

-(NSURLSessionDataTask*)add:(MSSharePointFile* )entity :(void (^)(MSSharePointFile *file, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSharePointFileFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointFileFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSSharePointFile class]];
}
@end
