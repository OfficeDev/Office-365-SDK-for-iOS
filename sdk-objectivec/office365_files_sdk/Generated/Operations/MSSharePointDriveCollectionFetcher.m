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

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSSharePointDrive class]];
}

-(NSURLSessionDataTask*)addDrive:(MSSharePointDrive*)entity withCallback:(void (^)(MSSharePointDrive *drive, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSSharePointDriveFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointDriveFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSSharePointDrive class]];
}
@end