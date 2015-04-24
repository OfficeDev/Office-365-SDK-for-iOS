/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataDefaultDependencyResolver.h"
#import "MSODataHttpConnection.h"
#import "MSODataJsonSerializerImpl.h"
#import "MSODataRequestImpl.h"
#import "MSODataLoggerImpl.h"

#import <UIKit/UIKit.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <mach/machine.h>

@implementation MSODataDefaultDependencyResolver

@synthesize httpTransport = _httpTransport;
@synthesize logger = _logger;
@synthesize jsonSerializer = _jsonSerializer;
@synthesize credentials = _credentials;

- (id<MSODataHttpTransport>)httpTransport {
    
    if (!_httpTransport) {
        
        _httpTransport = [[MSODataHttpConnection alloc] init];
    }
    
    return _httpTransport;
}

- (id<MSODataLogger>)logger {
    
    if (!_logger) {
        
        _logger = [[MSODataLoggerImpl alloc] init];
    }
    return _logger;
}

- (id<MSODataJsonSerializer>)jsonSerializer {
    
    if (!_jsonSerializer) {
        
        _jsonSerializer = [[MSODataJsonSerializerImpl alloc] init];
    }
    
    return _jsonSerializer;
}

- (id<MSODataRequest>)createODataRequest {
    
    return [[MSODataRequestImpl alloc] init];
}

- (NSString *)getPlatformUserAgent:(NSString *)productName {
    
    NSMutableString *cpu = [[NSMutableString alloc] init];
    
    cpu_type_t type;
    size_t size = sizeof(type);
    sysctlbyname("hw.cputype", &type, &size, NULL, 0);
    
    if (type == CPU_TYPE_X86) {
        
        [cpu appendString:@"x86 "];
        
    }else if (type == CPU_TYPE_ARM) {
        
        [cpu appendString:@"ARM"];
    }
    else if (type == CPU_TYPE_X86_64){
        
        [cpu appendString:@"X86_64"];
    }
    else {
        
        [cpu appendString:@"Other"];
    }
    
    return [[NSString alloc] initWithFormat:@"%@/1.0 (lang=%@; os=%@; os_version=%@; arch=%@; version=%d)", productName, @"Objective-C", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion], cpu ,6];
}

@end