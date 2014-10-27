/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataOperations.h"
#import "MSSharePointBaseODataContainerHelper.h"

/**
* The implementation file for type MSSharePointODataOperations.
*/

@implementation MSSharePointODataOperations

-(id)initOperationWithUrl:(NSString *)urlComponent Parent:(id<MSSharePointODataExecutable>)parent{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    return self;
}

-(NSURLSessionDataTask*)oDataExecute:(id<MSODataURL>)path : (NSData *)content : (MSHttpVerb)verb :(void (^)(id<MSResponse> ,NSError *error))callback{
    [path appendPathComponent:self.UrlComponent];
    [MSSharePointBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];
   
    return [self.Parent oDataExecute:path :content :verb :callback];
}

-(id<MSDependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
