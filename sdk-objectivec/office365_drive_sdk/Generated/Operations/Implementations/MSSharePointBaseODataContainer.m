/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointBaseODataContainer.h"
#import "MSSharePointBaseODataContainerHelper.h"

@interface MSSharePointBaseODataContainer()

@property id<MSDependencyResolver> resolver;

@end

/**
* The implementation file for type MSBaseODataContainer.
*/

@implementation MSSharePointBaseODataContainer

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver{
    self.UrlComponent = url;
    self.resolver = resolver;
    return self;
}

-(NSURLSessionDataTask *)oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb :(void (^)(id<MSResponse>, NSError *))callback{
    
	[MSSharePointBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];

    return [[[MSSharePointBaseODataContainerHelper alloc] initWitUrl:self.UrlComponent dependencyResolver:self.resolver]
            oDataExecute:path :content :verb : @"GetFullPrefix()-sdk/MSSharePointBaseODataContainer" : callback];
}

-(id<MSDependencyResolver>) getResolver{
    return self.resolver;
}

@end
