/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContact.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOContactFetcher.h"

/**
* The header for type MSOContactCollectionFetcher.
*/

@interface MSOContactCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOContact* )entity :(void (^)(MSOContact *contact, NSError *e))callback;

-(MSOContactFetcher*)getById:(NSString *)Id;
@end
