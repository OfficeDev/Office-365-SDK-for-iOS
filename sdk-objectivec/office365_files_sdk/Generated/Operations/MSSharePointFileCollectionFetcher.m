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

#import "MSSharePointFileCollectionFetcher.h"

/**
* The implementation file for type MSSharePointFileCollectionFetcher.
*/

@implementation MSSharePointFileCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSSharePointFile class]];
}

-(NSURLSessionDataTask*)addFile:(MSSharePointFile*)entity withCallback:(void (^)(MSSharePointFile *file, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSSharePointFileFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointFileFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSSharePointFile class]];
}
@end