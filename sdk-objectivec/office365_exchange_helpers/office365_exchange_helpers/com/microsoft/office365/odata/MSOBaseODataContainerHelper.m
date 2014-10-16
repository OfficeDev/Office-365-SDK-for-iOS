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

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb : (NSString*) productName :(void (^)(id<MSOResponse>, NSError *))callback{
    
    id<MSOHttpTransport> httpTransport = [self.Resolver getHttpTransport];
    id<MSORequest> request = [httpTransport createRequest];
    
    [request setVerb:verb];
    [request setUrl:[[NSMutableString alloc] initWithFormat:@"%@/%@", self.UrlComponent, path]];
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
    
    return result;
}

-(id<MSODependencyResolver>)getResolver{
    return self.Resolver;
}


@end