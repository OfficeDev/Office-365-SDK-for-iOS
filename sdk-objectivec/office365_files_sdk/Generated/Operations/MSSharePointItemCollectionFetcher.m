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

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSSharePointItem class]];
}

-(NSURLSessionDataTask*)addEntity:(MSSharePointItem*)entity withCallback:(void (^)(MSSharePointItem *item, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSharePointItemFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointItemFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSSharePointItem class]];
}
@end