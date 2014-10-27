/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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