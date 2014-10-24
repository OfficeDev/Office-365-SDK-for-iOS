/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSIdentitySet;
@class MSItemReference;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type Item.
*/

@interface MSItem : NSObject
@property MSIdentitySet *createdBy;
@property NSString *eTag;
@property NSString *id;
@property MSIdentitySet *lastModifiedBy;
@property NSString *name;
@property MSItemReference *parentReference;
@property int size;
@property NSDate *dateTimeCreated;
@property NSDate *dateTimeLastModified;
@property NSString *type;
@property NSString *webUrl;

@end