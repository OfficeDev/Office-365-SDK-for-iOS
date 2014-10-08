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
    [request addHeader:@"Content-Type" :@"application/json"];
    //@"" forHTTPHeaderField: @"Expect"];
  //  [request addHeader:@"Expect" :@"100-continue"];
    [[[[self getResolver] getCredentialsFactory]getCredentials]prepareRequest:request];
    //[[[self getResolver] getLogger]log:[[NSString alloc] initWithFormat:@"URL: %@", request.getUrl] : VERBOSE];
    //[[[self getResolver] getLogger]log:@"HEADERS : " : VERBOSE];
    return [httpTransport execute:request :^(Response *r, NSError *e) {
        callback(r,e);
    }];
    
   // return [httpTransport execute:request :^(Response *response, NSURLResponse *r, NSError *error) {
    //    callback(response, r, error);
    //}];
}


-(DependencyResolver*) getResolver{
    return self.resolver;
}

@end
