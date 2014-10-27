/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryBaseODataContainer.h"
#import "MSDirectoryBaseODataContainerHelper.h"

@interface MSDirectoryBaseODataContainer()

@property id<MSDependencyResolver> resolver;

@end

/**
* The implementation file for type MSBaseODataContainer.
*/

@implementation MSDirectoryBaseODataContainer

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver{
    self.UrlComponent = url;
    self.resolver = resolver;
    return self;
}

-(NSURLSessionDataTask *)oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb :(void (^)(id<MSResponse>, NSError *))callback{
    
	[MSDirectoryBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];

    return [[[MSDirectoryBaseODataContainerHelper alloc] initWitUrl:self.UrlComponent dependencyResolver:self.resolver]
            oDataExecute:path :content :verb : @"GetFullPrefix()-sdk/MSDirectoryBaseODataContainer" : callback];
}

-(id<MSDependencyResolver>) getResolver{
    return self.resolver;
}

@end
