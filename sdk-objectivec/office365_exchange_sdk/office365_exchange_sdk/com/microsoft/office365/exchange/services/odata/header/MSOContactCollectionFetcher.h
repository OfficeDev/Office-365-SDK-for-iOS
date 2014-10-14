/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOContact.h"
#import "MSOContactFetcher.h"

@interface MSOContactCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOContact> *Contact, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOContact* )entity :(void (^)(MSOContact *contact, NSError *e))callback;

-(MSOContactFetcher*)getById:(NSString *)Id;
@end
