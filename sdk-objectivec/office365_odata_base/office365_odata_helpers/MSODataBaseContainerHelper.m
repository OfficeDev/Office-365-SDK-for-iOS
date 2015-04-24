/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataBaseContainerHelper.h"
#import "MSODataDependencyResolver.h"
#import "MSOCalendarSerializer.h"
#import "MSODataRequest.h"
#import "MSODataURL.h"

@interface MSODataBaseContainerHelper()

@property (copy, nonatomic, readonly) NSString *urlComponent;

@end

@implementation MSODataBaseContainerHelper

@synthesize resolver = _resolver;

- (id)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver {
    
    if (self = [super init]) {
        
        _urlComponent = url;
        _resolver = resolver;
    }
    
    return self;
}

+ (NSString *)generatePayloadWithParameters:(NSArray *)parameters
                         dependencyResolver:(id<MSODataDependencyResolver>)resolver {
    
    NSMutableString *result = [[NSMutableString alloc] initWithString:@"{"];
    
    NSArray *reversedParameters = [parameters reverseObjectEnumerator].allObjects;
    
    for (NSDictionary *item in reversedParameters) {
        
        for (NSString *key in item.allKeys) {
            
            [result appendFormat:@"\"%@\":%@,", key, [item objectForKey:key]];
        }
    }
    
    return [NSString stringWithFormat:@"%@}", [result substringWithRange:NSMakeRange(0, [result length] -1)]];
}

+ (void)addCustomParametersToODataURLWithRequest:(id<MSODataRequest>)request
                                      parameters:(NSDictionary *)parameters
                                         headers:(NSDictionary *)headers
                              dependencyResolver:(id<MSODataDependencyResolver>)resolver {
    
    for (NSString *key in parameters.allKeys) {
       
        id object = [parameters objectForKey:key];
        
        NSString *value = [object isKindOfClass:[NSDate class]] ? [MSOCalendarSerializer serialize:object]
                                                                : [[NSString alloc] initWithFormat: @"\"%@\"", object];
        
        [request.url addQueryStringParameter:key value:value];
    }
    
    for (NSString *header in headers.allKeys) {
        
        [request addHeaderWithName:header value:[headers objectForKey:header]];
    }
}

+ (NSString *)getFunctionParameters:(NSDictionary *)parameters {
    
    NSMutableString *theString = [[NSMutableString alloc] init];
    
    for (NSString *key in parameters.allKeys) {
       
        if (theString.length > 0) {
            
            [theString appendString:@","];
        }
        
        [theString appendFormat:@"%@=%@", key, [self toODataURLValue:[parameters objectForKey:key]]];
    }
    
    return theString;
}

+ (NSString *)toODataURLValue:(id)o {
    
    return [NSString stringWithFormat:@"'%@'", o];
}

@end