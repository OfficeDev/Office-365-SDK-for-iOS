//
//  BaseODataContainer.m
//  office365-exchange-sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

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

-(NSURLSessionDataTask*) oDataExecute:(NSString *)path :(NSData *)content :(HttpVerb)verb : (void (^)(NSData *, NSURLResponse *, NSError *))callback{
    
    HttpTransport* httpTransport = [[self getResolver] getHttpTransport];
    Request* request = [httpTransport createRequest];
    [request setVerb:verb];
    
    [request setUrl:[[NSMutableString alloc] initWithFormat:@"%@/%@", self.url, path]];
    [request setContent:content];
    [[[self getResolver] getLogger] log:[[NSString alloc] initWithData:(content == nil ? [NSData alloc] : content) encoding:NSUTF8StringEncoding] :VERBOSE];
    
    [request addHeader:@"Content-Type" :@"application/json"];
    [[[[self getResolver] getCredentialsFactory]getCredentials]prepareRequest:request];
    [[[self getResolver] getLogger]log:[[NSString alloc] initWithFormat:@"URL: %@", request.getUrl] : VERBOSE];
    [[[self getResolver] getLogger]log:@"HEADERS : " : VERBOSE];

    return [httpTransport execute:request :^(Response *response, NSURLResponse *r, NSError *error) {
        callback(response, r, error);
    }];
}


-(DependencyResolver*) getResolver{
    return self.resolver;
}

@end