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

#import "MSOutlookItemCollectionFetcher.h"

/**
* The implementation file for type MSOutlookItemCollectionFetcher.
*/

@implementation MSOutlookItemCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookItem class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookItem* )entity :(void (^)(MSOutlookItem *item, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookItemFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookItemFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookItem class]];
}
@end
