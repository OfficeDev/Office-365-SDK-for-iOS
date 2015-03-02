/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataLoggerImpl.h"

@implementation MSODataLoggerImpl

-(void) logMessage:(NSString *)message withLevel:(MSODataLogLevel)logLevel {
    
    NSString* levelString = [NSString alloc];
    
    switch (logLevel) {
        case ERROR:
            levelString = @"ERROR";
            break;
        case INFO:
            levelString = @"INFO";
            break;
        case VERBOSE:
            levelString = @"VERBOSE";
            break;
        case WARNING:
            levelString = @"WARNING";
            break;
        default:
            levelString = @"LOG";
    }
    
    NSLog(@"%@ : %@",levelString, message);
}


-(void)log:(NSString *)content :(MSODataLogLevel)logLevel{
    [self logMessage:content withLevel:logLevel];
}

@end