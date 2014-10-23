/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSLogLevel.h"

@protocol MSLogger

@required
-(void) log : (NSString*) content : (MSLogLevel*) logLevel;

@end