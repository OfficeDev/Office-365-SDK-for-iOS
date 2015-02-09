/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataLoggerImpl.h"

@implementation MSODataLoggerImpl

-(void)log:(NSString *)content :(MSODataLogLevel)logLevel{
    
    NSString* levelString = [NSString alloc];
    
    switch (logLevel) {
        case ERROR:
            levelString = @"ERROR";
            break;
        case INFO:
            levelString = @"INFO";
        case VERBOSE:
            levelString = @"VERBOSE";
        case WARNING:
            levelString = @"WARNING";
        default:
            levelString = @"LOG";
    }
    
    NSLog(@"%@ : %@",levelString, content);
}

@end