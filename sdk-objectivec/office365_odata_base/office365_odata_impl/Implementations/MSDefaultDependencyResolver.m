/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <office365_odata_base/office365_odata_base.h>

#include <sys/types.h>
#include <sys/sysctl.h>
#include <mach/machine.h>


@interface MSDefaultDependencyResolver()

@property (nonatomic)  id<MSCredentialsFactory> mCredentialsFactory;

@end

@implementation MSDefaultDependencyResolver

-(void) setCredentialsFactory : (id<MSCredentialsFactory>) credentialsFactory{
    self.mCredentialsFactory = credentialsFactory;
}

-(id<MSHttpTransport>)getHttpTransport{
    return [MSHttpConnection alloc];
}

-(id<MSLogger>) getLogger{
    return [MSLoggerImpl alloc];
}

-(id<MSJsonSerializer>) getJsonSerializer{
    MSJsonSerializerImpl* parser = [MSJsonSerializerImpl alloc];
    [parser jsonSerializerImpl];
    
    return parser;
}

-(id<MSCredentialsFactory>) getCredentialsFactory{
    return self.mCredentialsFactory;
}

-(id<MSODataURL>)createODataURL{
    return [[MSODataURLImpl alloc] init];
}

-(NSString*)getPlatformUserAgent : (NSString*) productName{
    
    NSMutableString* cpu = [[NSMutableString alloc] init];
    cpu_type_t type;
    size_t size = sizeof(type);
    sysctlbyname("hw.cputype", &type, &size, NULL, 0);
    
    if (type == CPU_TYPE_X86){
        [cpu appendString:@"x86 "];
        
    }else if (type == CPU_TYPE_ARM){
        [cpu appendString:@"ARM"];
    }
    else if(type == CPU_TYPE_X86_64){
        [cpu appendString:@"X86_64"];
    }
    else{
        [cpu appendString:@"Other"];
    }
    
    return [[NSString alloc] initWithFormat:@"%@/1.0 (lang=%@; os=%@; os_version=%@; arch=%@; version=%d)", productName, @"Objective-C", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion], cpu ,6];
}

@end