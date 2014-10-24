/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@interface MSFilesBaseODataContainer()

@property id<MSFilesDependencyResolver> resolver;

@end

/**
* The implementation file for type MSFilesBaseODataContainer.
*/

@implementation MSFilesBaseODataContainer

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSFilesDependencyResolver>) resolver{
    self.UrlComponent = url;
    self.resolver = resolver;
    return self;
}

-(NSURLSessionDataTask *)oDataExecute:(id<MSFilesODataURL>)path :(NSData *)content :(MSFilesHttpVerb)verb :(void (^)(id<MSFilesResponse>, NSError *))callback{
    
	[MSFilesBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];

    return [[[MSFilesBaseODataContainerHelper alloc] initWitUrl:self.UrlComponent dependencyResolver:self.resolver]
            oDataExecute:path :content :verb : @"office365_exchange_sdk/MSOBaseODataContainer" : callback];
}

-(id<MSFilesDependencyResolver>) getResolver{
    return self.resolver;
}

@end
