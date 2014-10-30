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

#import "MSSharePointFolderCollectionFetcher.h"

/**
* The implementation file for type MSSharePointFolderCollectionFetcher.
*/

@implementation MSSharePointFolderCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent;{
    return [super initWith:urlComponent :parent : [MSSharePointFolder class]];
}

-(NSURLSessionDataTask*)add:(MSSharePointFolder* )entity :(void (^)(MSSharePointFolder *folder, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSharePointFolderFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointFolderFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSSharePointFolder class]];
}
@end
