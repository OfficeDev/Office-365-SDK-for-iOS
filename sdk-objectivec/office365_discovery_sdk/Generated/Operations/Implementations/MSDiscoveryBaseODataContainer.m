/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryBaseODataContainer.h"
#import "MSDiscoveryBaseODataContainerHelper.h"

@interface MSDiscoveryBaseODataContainer()

@property id<MSDependencyResolver> resolver;

@end

/**
* The implementation file for type MSBaseODataContainer.
*/

@implementation MSDiscoveryBaseODataContainer

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver{
    self.UrlComponent = url;
    self.resolver = resolver;
    return self;
}

-(NSURLSessionDataTask *)oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb :(void (^)(id<MSResponse>, NSError *))callback{
    
	[MSDiscoveryBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];

    return [[[MSDiscoveryBaseODataContainerHelper alloc] initWitUrl:self.UrlComponent dependencyResolver:self.resolver]
            oDataExecute:path :content :verb : @"GetFullPrefix()-sdk/MSDiscoveryBaseODataContainer" : callback];
}

-(id<MSDependencyResolver>) getResolver{
    return self.resolver;
}

@end
