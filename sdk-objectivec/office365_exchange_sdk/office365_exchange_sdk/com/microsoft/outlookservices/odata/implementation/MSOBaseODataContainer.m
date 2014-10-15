/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSOBaseODataContainer.h"

@interface MSOBaseODataContainer()

@property id<MSODependencyResolver> resolver;

@end

/**
* The implementation file for type MSOBaseODataContainer.
*/

@implementation MSOBaseODataContainer

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver{
    self.UrlComponent = url;
    self.resolver = resolver;
    return self;
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
    id<MSOHttpTransport> httpTransport = [[self getResolver] getHttpTransport];
    id<MSORequest> request = [httpTransport createRequest];
    
    [request setVerb:verb];
    [request setUrl:[[NSMutableString alloc] initWithFormat:@"%@/%@", self.UrlComponent, path]];
    //[request setUrl:path];
    [request setContent:content];
    [request addHeader:@"Content-Type" :@"application/json"];
    
    [[[[self getResolver] getCredentialsFactory]getCredentials]prepareRequest:request];
    
    return [httpTransport execute:request :^(id<MSOResponse> r, NSError *e) {
        callback(r,e);
    }];
}

-(id<MSODependencyResolver>) getResolver{
    return self.resolver;
}

@end
