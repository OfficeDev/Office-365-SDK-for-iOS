	
/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataOperations.h"
#import "MSDirectoryBaseODataContainerHelper.h"

/**
* The implementation file for type MSDirectoryODataOperations.
*/

@implementation MSDirectoryODataOperations

-(id)initOperationWithUrl:(NSString *)urlComponent Parent:(id<MSDirectoryODataExecutable>)parent{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    return self;
}

-(NSURLSessionDataTask*)oDataExecute:(id<MSODataURL>)path : (NSData *)content : (MSHttpVerb)verb :(void (^)(id<MSResponse> ,NSError *error))callback{
    [path appendPathComponent:self.UrlComponent];
    [MSDirectoryBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];
   
    return [self.Parent oDataExecute:path :content :verb :callback];
}

-(id<MSDependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
