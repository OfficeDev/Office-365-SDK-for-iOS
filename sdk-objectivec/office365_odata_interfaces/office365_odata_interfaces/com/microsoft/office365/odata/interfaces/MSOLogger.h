/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSOLogLevel.h"

@protocol MSOLogger

@required
-(void) log : (NSString*) content : (MSOLogLevel*) logLevel;

@end