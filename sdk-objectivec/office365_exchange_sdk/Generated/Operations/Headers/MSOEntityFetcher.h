/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MSOODataEntityFetcher.h"
#import "MSOEntityOperations.h"
#import "MSOEntity.h"



/**
* The header for type MSOEntityFetcher.
*/

@interface MSOEntityFetcher : MSOODataEntityFetcher

-(MSOEntityOperations*) getOperations;

@end