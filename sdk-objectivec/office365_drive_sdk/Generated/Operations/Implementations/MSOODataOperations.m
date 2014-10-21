/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataOperations.h"

/**
* The implementation file for type MSOODataOperations.
*/

@implementation MSOODataOperations

-(id)initOperationWithUrl:(NSString *)urlComponent Parent:(id<MSOODataExecutable>)parent{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    return self;
}

-(NSURLSessionDataTask*)oDataExecute:(id<MSOODataURL>)path : (NSData *)content : (MSOHttpVerb)verb :(void (^)(id<MSOResponse> ,NSError *error))callback{
    [path appendPathComponent:self.UrlComponent];
    [MSOBaseODataContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];
   
    return [self.Parent oDataExecute:path :content :verb :callback];
}

-(id<MSODependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
