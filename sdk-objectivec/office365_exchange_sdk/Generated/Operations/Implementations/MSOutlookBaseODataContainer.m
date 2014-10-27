/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookBaseODataContainer.h"
#import "MSOutlookBaseODataContainerHelper.h"

@interface MSOutlookBaseODataContainer()

@property id<MSDependencyResolver> resolver;

@end

/**
* The implementation file for type MSBaseODataContainer.
*/

@implementation MSOutlookBaseODataContainer

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver{
    self.UrlComponent = url;
    self.resolver = resolver;
    return self;
}

-(NSURLSessionDataTask *)oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb :(void (^)(id<MSResponse>, NSError *))callback{
    
	[MSOutlookBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];

    return [[[MSOutlookBaseODataContainerHelper alloc] initWitUrl:self.UrlComponent dependencyResolver:self.resolver]
            oDataExecute:path :content :verb : @"GetFullPrefix()-sdk/MSOutlookBaseODataContainer" : callback];
}

-(id<MSDependencyResolver>) getResolver{
    return self.resolver;
}

@end
