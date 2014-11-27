/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataBaseContainerHelper.h"

@interface MSODataBaseContainerHelper()

@property id<MSODataDependencyResolver> Resolver;
@property NSString* UrlComponent;

@end

@implementation MSODataBaseContainerHelper

-(id)initWithUrl : (NSString *)url  dependencyResolver : (id<MSODataDependencyResolver>) resolver{
    self.UrlComponent = url;
    self.resolver = resolver;
    return self;
}

+(NSString*)generatePayload:(NSArray *)parameters :(id<MSODataDependencyResolver>)resolver{
    
    NSMutableString* result = [[NSMutableString alloc] initWithString:@"{"];
    for (NSDictionary* item in parameters) {
        
        for (NSString* key in [item allKeys]) {
        
            id object = [item objectForKey:key] ;
            NSString* parsed = [[resolver getJsonSerializer]serialize:object :key];
            [result appendFormat:@"\"%@\":%@,",key,parsed];
        }
    }
    
    NSString* r= [result substringWithRange:NSMakeRange(0, [result length] -1)];
    result = [[NSMutableString alloc] initWithString:r];
    [result appendFormat:@"}"];
    NSString* value = result;
    return value;
}

-(id<MSODataDependencyResolver>)getResolver{
    return self.Resolver;
}

+(void)addCustomParametersToODataURL : (id<MSODataURL>) url : (NSDictionary*) parameters : (id<MSODataDependencyResolver>) resolver{
    
    for (NSString* key in [parameters allKeys]) {
        NSString* value = [parameters objectForKey:key];
        [url addQueryStringParameter:value :key];
    }
}

+(NSString*)getFunctionParameters :(NSDictionary*)parameters {
    NSMutableString* theString = [[NSMutableString alloc] init];
    
    for (NSString* key in [parameters allKeys]) {
        if([theString length]>0){
            [theString appendString:@","];
        }
        
        [theString appendString:key];
        [theString appendString:@"="];
        NSString* odataValue = [self toODataURLValue: [parameters objectForKey:key]];
        [theString appendString:odataValue];
    }
    
    return theString;
}

+(NSString*) toODataURLValue : (id) o {
    NSMutableString* result = [[NSMutableString alloc] init];
    
    [result appendFormat:@"'%@'", o];
    return result;
    /*if (o instanceof String) {
        return "'" + o + "'";
    }
    
    if (o instanceof Calendar) {
        return "'" + CalendarSerializer.serialize((Calendar)o) + "'";
    }
    
    return o.toString();*/
    //return nil;
}

@end