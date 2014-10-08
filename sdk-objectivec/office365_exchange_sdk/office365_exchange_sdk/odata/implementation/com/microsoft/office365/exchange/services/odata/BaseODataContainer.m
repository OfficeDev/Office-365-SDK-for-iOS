/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseODataContainer.h"

@interface BaseODataContainer()

@property NSString* url;
@property id<MSODependencyResolver> resolver;

@end

@implementation BaseODataContainer

-(id)initWith : (NSString*)url : (id<MSODependencyResolver>) resolver{
    self.url = url;
    self.resolver = resolver;
    
    return self;
}

-(NSURLSessionDataTask*) oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb : (void (^)(id<MSORequest>, NSError *))callback{
    
    id<MSOHttpTransport> httpTransport = [[self getResolver] getHttpTransport];
    id<MSORequest> request = [httpTransport createRequest];
    [request setVerb:verb];
    
    [request setUrl:[[NSMutableString alloc] initWithFormat:@"%@/%@", self.url, path]];
    [request setContent:content];
    [request addHeader:@"Content-Type" :@"application/json"];    [[[[self getResolver] getCredentialsFactory]getCredentials]prepareRequest:request];
    return [httpTransport execute:request :^(id<MSOResponse> r, NSError *e) {
        callback(r,e);
    }];
}

-(id<MSODependencyResolver>) getResolver{
    return self.resolver;
}

@end
