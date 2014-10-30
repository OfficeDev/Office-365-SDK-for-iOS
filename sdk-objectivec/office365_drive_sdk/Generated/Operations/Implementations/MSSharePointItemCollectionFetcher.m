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

#import "MSSharePointItemCollectionFetcher.h"

/**
* The implementation file for type MSSharePointItemCollectionFetcher.
*/

@implementation MSSharePointItemCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent;{
    return [super initWith:urlComponent :parent : [MSSharePointItem class]];
}

-(NSURLSessionDataTask*)add:(MSSharePointItem* )entity :(void (^)(MSSharePointItem *item, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSharePointItemFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointItemFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSSharePointItem class]];
}
@end
