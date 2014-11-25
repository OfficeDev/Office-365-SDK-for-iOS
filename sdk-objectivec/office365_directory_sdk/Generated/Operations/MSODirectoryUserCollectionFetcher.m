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

#import "MSODirectoryUserCollectionFetcher.h"

/**
* The implementation file for type MSODirectoryUserCollectionFetcher.
*/

@implementation MSODirectoryUserCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSODirectoryUser class]];
}

-(NSURLSessionDataTask*)addEntity:(MSODirectoryUser*)entity withCallback:(void (^)(MSODirectoryUser *user, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSODirectoryUserFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSODirectoryUserFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSODirectoryUser class]];
}
@end