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

#import "MSOutlookEventCollectionFetcher.h"

/**
* The implementation file for type MSOutlookEventCollectionFetcher.
*/

@implementation MSOutlookEventCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookEvent class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookEvent* )entity :(void (^)(MSOutlookEvent *event, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookEventFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookEventFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookEvent class]];
}
@end
