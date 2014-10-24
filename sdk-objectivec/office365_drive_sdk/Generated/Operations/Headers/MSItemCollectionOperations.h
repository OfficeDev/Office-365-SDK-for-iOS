#import "MSIdentitySet.h"
#import "MSItemReference.h"


/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataOperations.h"

/**
* The header for type MSItemCollectionOperations.
*/

@interface MSItemCollectionOperations : MSODataOperations
-(NSURLSessionDataTask*)getByPath : (NSString *) path : (void (^)(MSItem *item, NSError *error))callback;			
@end