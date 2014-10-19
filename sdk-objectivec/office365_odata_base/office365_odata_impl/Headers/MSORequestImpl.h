/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSORequest.h"

@interface MSORequestImpl : NSObject<MSORequest>

-(NSMutableURLRequest*)getMutableRequest;

@end