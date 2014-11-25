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

#import "MSOSharePointIdentitySet.h"
#import "MSOSharePointItem.h"
#import <office365_odata_base/office365_odata_base.h>

/**
* The header for type MSOSharePointItemCollectionOperations.
*/

@interface MSOSharePointItemCollectionOperations : MSODataOperations

-(NSURLSessionDataTask*)getByPath : (NSString *) path : (void (^)(MSOSharePointItem *item, NSError *error))callback;

@end