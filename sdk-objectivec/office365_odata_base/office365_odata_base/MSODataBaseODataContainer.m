/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataBaseContainer.h"
#import "MSODataBaseContainerHelper.h"

@interface MSODataBaseContainer()

@property id<MSODataDependencyResolver> resolver;

@end

/**
* The implementation file for type MSBaseODataContainer.
*/

@implementation MSODataBaseContainer

@synthesize Parent;
@synthesize UrlComponent;

-(id)initWithUrl : (NSString *)url  dependencyResolver : (id<MSODataDependencyResolver>) resolver{
    self.UrlComponent = url;
    self.resolver = resolver;
    return self;
}

-(NSURLSessionDataTask *)oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSODataHttpVerb)verb :(void (^)(id<MSODataResponse>, NSError *))callback{
    
	[MSODataBaseContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];

    return [[[MSODataBaseContainerHelper alloc] initWithUrl:self.UrlComponent dependencyResolver:self.resolver]
            oDataExecute:path :content :verb : @"GetFullPrefix()-sdk/MSOutlookBaseODataContainer" : callback];
}

-(id<MSODataDependencyResolver>) getResolver{
    return self.resolver;
}

@end
