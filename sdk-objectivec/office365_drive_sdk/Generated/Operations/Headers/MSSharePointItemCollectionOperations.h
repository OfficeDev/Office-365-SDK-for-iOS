#import "MSSharePointIdentitySet.h"
#import "MSSharePointItemReference.h"


/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataOperations.h"

/**
* The header for type MSSharePointItemCollectionOperations.
*/

@interface MSSharePointItemCollectionOperations : MSSharePointODataOperations
-(NSURLSessionDataTask*)getByPath : (NSString *) path : (void (^)(MSSharePointItem *item, NSError *error))callback;			
@end