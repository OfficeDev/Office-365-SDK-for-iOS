/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "BaseODataContainer.h"

@interface BaseODataContainer()

@property NSString* url;
@property DependencyResolver* resolver;

@end

@implementation BaseODataContainer

-(id)initWith : (NSString*)url : (DependencyResolver*) resolver{
    self.url = url;
    self.resolver = resolver;
    
    return self;
}

-(NSURLSessionDataTask*) oDataExecute:(NSString *)path :(NSData *)content :(HttpVerb)verb : (void (^)(Request *, NSError *))callback{
    
    HttpTransport* httpTransport = [[self getResolver] getHttpTransport];
    Request* request = [httpTransport createRequest];
    [request setVerb:verb];
    
    [request setUrl:[[NSMutableString alloc] initWithFormat:@"%@/%@", self.url, path]];
    [request setContent:content];
    [request addHeader:@"Content-Type" :@"application/json"];    [[[[self getResolver] getCredentialsFactory]getCredentials]prepareRequest:request];
    return [httpTransport execute:request :^(Response *r, NSError *e) {
        callback(r,e);
    }];
}

-(DependencyResolver*) getResolver{
    return self.resolver;
}

@end
