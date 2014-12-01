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

#import "MSDirectoryUserCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryUserCollectionFetcher.
*/

@implementation MSDirectoryUserCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSDirectoryUser class]];
}

-(NSURLSessionDataTask*)addUser:(MSDirectoryUser*)entity withCallback:(void (^)(MSDirectoryUser *user, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSDirectoryUserFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryUserFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSDirectoryUser class]];
}
@end