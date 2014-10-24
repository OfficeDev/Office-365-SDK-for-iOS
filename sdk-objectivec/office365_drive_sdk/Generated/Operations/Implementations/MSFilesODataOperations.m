/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataOperations.h"

/**
* The implementation file for type MSFilesODataOperations.
*/

@implementation MSFilesODataOperations

-(id)initOperationWithUrl:(NSString *)urlComponent Parent:(id<MSFilesODataExecutable>)parent{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    return self;
}

-(NSURLSessionDataTask*)oDataExecute:(id<MSFilesODataURL>)path : (NSData *)content : (MSFilesHttpVerb)verb :(void (^)(id<MSFilesResponse> ,NSError *error))callback{
    [path appendPathComponent:self.UrlComponent];
    [MSFilesBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];
   
    return [self.Parent oDataExecute:path :content :verb :callback];
}

-(id<MSFilesDependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
