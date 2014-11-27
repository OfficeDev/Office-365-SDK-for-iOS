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

#import "MSDirectorySubscribedSkuCollectionFetcher.h"

/**
* The implementation file for type MSDirectorySubscribedSkuCollectionFetcher.
*/

@implementation MSDirectorySubscribedSkuCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSDirectorySubscribedSku class]];
}

-(NSURLSessionDataTask*)addSubscribedSku:(MSDirectorySubscribedSku*)entity withCallback:(void (^)(MSDirectorySubscribedSku *subscribedSku, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectorySubscribedSkuFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectorySubscribedSkuFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSDirectorySubscribedSku class]];
}
@end