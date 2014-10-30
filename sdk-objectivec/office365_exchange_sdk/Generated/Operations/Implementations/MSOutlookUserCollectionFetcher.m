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

#import "MSOutlookUserCollectionFetcher.h"

/**
* The implementation file for type MSOutlookUserCollectionFetcher.
*/

@implementation MSOutlookUserCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookUser class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookUser* )entity :(void (^)(MSOutlookUser *user, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookUserFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookUserFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookUser class]];
}
@end
