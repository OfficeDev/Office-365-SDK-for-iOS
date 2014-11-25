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

#import "MSOSharePointFileCollectionFetcher.h"

/**
* The implementation file for type MSOSharePointFileCollectionFetcher.
*/

@implementation MSOSharePointFileCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSOSharePointFile class]];
}

-(NSURLSessionDataTask*)addEntity:(MSOSharePointFile*)entity withCallback:(void (^)(MSOSharePointFile *file, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOSharePointFileFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOSharePointFileFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSOSharePointFile class]];
}
@end