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

#import "MSGraphServiceODataEntities.h"

/**
* The implementation file for type MSGraphServiceSubscribedSkuCollectionFetcher.
*/

@implementation MSGraphServiceSubscribedSkuCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSGraphServiceSubscribedSku class]];
}

-(NSURLSessionTask*)addSubscribedSku:(MSGraphServiceSubscribedSku*)entity withCallback:(void (^)(MSGraphServiceSubscribedSku *subscribedSku, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSGraphServiceSubscribedSkuFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSGraphServiceSubscribedSkuFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSGraphServiceSubscribedSku class]];
}
@end