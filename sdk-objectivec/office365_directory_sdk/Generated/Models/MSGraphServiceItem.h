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

@class MSGraphServiceIdentitySet;
@class MSGraphServiceIdentitySet;
@class MSGraphServiceItemReference;
@class MSGraphServiceUser;
@class MSGraphServiceUser;


#import "MSGraphServiceProtocols.h"

#import <Foundation/Foundation.h>


/**
* The header for type Item.
*/

@interface MSGraphServiceItem : NSObject

@property NSString *$$__ODataType;
@property MSGraphServiceIdentitySet *createdBy;
@property NSString *eTag;
@property NSString *id;
@property MSGraphServiceIdentitySet *lastModifiedBy;
@property NSString *name;
@property MSGraphServiceItemReference *parentReference;
@property int size;
@property NSDate *dateTimeCreated;
@property NSDate *dateTimeLastModified;
@property NSString *type;
@property NSString *webUrl;
@property MSGraphServiceUser *createdByUser;
@property MSGraphServiceUser *lastModifiedByUser;

@end