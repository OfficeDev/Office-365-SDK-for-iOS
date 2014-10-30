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

#import "MSSharePointDriveCollectionFetcher.h"

/**
* The implementation file for type MSSharePointDriveCollectionFetcher.
*/

@implementation MSSharePointDriveCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent;{
    return [super initWith:urlComponent :parent : [MSSharePointDrive class]];
}

-(NSURLSessionDataTask*)add:(MSSharePointDrive* )entity :(void (^)(MSSharePointDrive *drive, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSharePointDriveFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointDriveFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSSharePointDrive class]];
}
@end
