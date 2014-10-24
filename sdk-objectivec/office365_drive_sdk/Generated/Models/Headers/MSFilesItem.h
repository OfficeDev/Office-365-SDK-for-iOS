/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSFilesIdentitySet;
@class MSFilesItemReference;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type Item.
*/

@interface MSFilesItem : NSObject
@property MSOIdentitySet *createdBy;
@property NSString *eTag;
@property NSString *id;
@property MSOIdentitySet *lastModifiedBy;
@property NSString *name;
@property MSOItemReference *parentReference;
@property int size;
@property NSDate *dateTimeCreated;
@property NSDate *dateTimeLastModified;
@property NSString *type;
@property NSString *webUrl;

@end