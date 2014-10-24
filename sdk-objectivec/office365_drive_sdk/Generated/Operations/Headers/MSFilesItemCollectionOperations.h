#import "MSFilesIdentitySet.h"
#import "MSFilesItemReference.h"


/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataOperations.h"

/**
* The header for type MSFilesItemCollectionOperations.
*/

@interface MSFilesItemCollectionOperations : MSFilesODataOperations
-(NSURLSessionDataTask*)getByPath : (NSString *) path : (void (^)(MSOItem *item, NSError *error))callback;			
@end