/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSSharePointProtocols.h"
#import "MSSharePointItem.h"

/**
* The header for type File.
*/

@interface MSSharePointFile : MSSharePointItem
@property NSString *contentUrl;

@end