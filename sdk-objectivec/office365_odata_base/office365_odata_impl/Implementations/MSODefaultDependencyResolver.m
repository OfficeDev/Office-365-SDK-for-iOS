/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "office365_odata_impl.h"

#include <sys/types.h>
#include <sys/sysctl.h>
#include <mach/machine.h>


@interface MSODefaultDependencyResolver()

@property (nonatomic)  id<MSOCredentialsFactory> mCredentialsFactory;

@end

@implementation MSODefaultDependencyResolver

-(void) setCredentialsFactory : (id<MSOCredentialsFactory>) credentialsFactory{
    self.mCredentialsFactory = credentialsFactory;
}

-(id<MSOHttpTransport>)getHttpTransport{
    return [MSOHttpConnection alloc];
}

-(id<MSOLogger>) getLogger{
    return [MSOLoggerImpl alloc];
}

-(id<MSOJsonSerializer>) getJsonSerializer{
    MSOJsonSerializerImpl* parser = [MSOJsonSerializerImpl alloc];
    [parser jsonSerializerImpl];
    
    return parser;
}

-(id<MSOCredentialsFactory>) getCredentialsFactory{
    return self.mCredentialsFactory;
}

-(id<MSOODataURL>)createODataURL{
    return [[MSOODataURLImpl alloc] init];
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