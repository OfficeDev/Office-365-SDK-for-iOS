/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSODataLogLevel.h"

@protocol MSODataLogger

@required

- (void)logMessage:(NSString *)message withLevel:(MSODataLogLevel)logLevel;

@end