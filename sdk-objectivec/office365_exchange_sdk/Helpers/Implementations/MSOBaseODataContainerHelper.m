/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOBaseODataContainerHelper.h"

@interface MSOBaseODataContainerHelper()

@property id<MSODependencyResolver> Resolver;
@property NSString* UrlComponent;

@end

@implementation MSOBaseODataContainerHelper

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver{
    self.UrlComponent = url;
    self.resolver = resolver;
    return self;
}

-(NSURLSessionDataTask *)oDataExecute:(id<MSOODataURL>)path :(NSData *)content :(MSOHttpVerb)verb : (NSString*) productName :(void (^)(id<MSOResponse>, NSError *))callback{
    
    [path setBaseUrl:self.UrlComponent];
    id<MSOHttpTransport> httpTransport = [self.Resolver getHttpTransport];
    id<MSORequest> request = [httpTransport createRequest];
    
    [request setVerb:verb];
    [request setUrl: [path toString]];
    [request setContent:content];
    [request addHeader:@"Content-Type" :@"application/json"];
    [request addHeader:@"User-Agent" :[self.Resolver getPlatformUserAgent:productName]];
    
    [[[self.Resolver getCredentialsFactory]getCredentials]prepareRequest:request];
   
    return [httpTransport execute:request :^(id<MSOResponse> r, NSError *e) {
        callback(r,e);
    }];
}

+(NSString*)generatePayload:(NSArray *)parameters :(id<MSODependencyResolver>)resolver{
    
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

-(id<MSODependencyResolver>)getResolver{
    return self.Resolver;
}

+(void)addCustomParametersToODataURL : (id<MSOODataURL>) url : (NSDictionary*) parameters : (id<MSODependencyResolver>) resolver{
    
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
    return nil;
}

@end