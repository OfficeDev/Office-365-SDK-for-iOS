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

@class MSSharePointIdentitySet;
@class MSSharePointItemReference;

#import <Foundation/Foundation.h>
#import "MSSharePointProtocols.h"


/**
* The header for type Item.
*/

@interface MSSharePointItem : NSObject


@property NSString *$$__ODataType;

@property MSSharePointIdentitySet *createdBy;

@property NSString *eTag;

@property NSString *id;

@property MSSharePointIdentitySet *lastModifiedBy;

@property NSString *name;

@property MSSharePointItemReference *parentReference;

@property int size;

@property NSDate *dateTimeCreated;

@property NSDate *dateTimeLastModified;

@property NSString *type;

@property NSString *webUrl;


@end