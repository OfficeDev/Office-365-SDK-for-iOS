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

+(void)addCustomParametersToODataURL : (id<MSODataRequest>) request : (NSDictionary*) parameters : (NSDictionary*) headers : (id<MSODataDependencyResolver>) resolver{
    
    for (NSString* key in [parameters allKeys]) {
        id object = [parameters objectForKey:key];
        NSString* value = @"";
        
        if([object isKindOfClass:[NSDate class]]){
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssz"];
            NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
            [dateFormatter setTimeZone:timeZone];
            value = [[[dateFormatter stringFromDate:object] substringToIndex:19] stringByAppendingString:@"Z"];
        }else{
            value = [[NSString alloc] initWithFormat: @"\"%@\"", object];
        }
        
        [[request getUrl] addQueryStringParameter:key : value];
    }
    
    for (NSString* header in [headers allKeys]) {
        [request addHeader:header : [headers objectForKey:header]];
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