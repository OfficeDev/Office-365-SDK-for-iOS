/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type ItemReference.
*/

@interface MSFilesItemReference : NSObject

@property NSString *driveId;
@property NSString *id;
@property NSString *path;

@end