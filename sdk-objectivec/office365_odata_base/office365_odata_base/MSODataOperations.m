/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataOperations.h"

@implementation MSODataOperations

-(id)initOperationWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    
    return self;
}

-(NSURLSessionDataTask *)oDataExecuteWithRequest:(id<MSODataRequest>)request callback:(void (^)(id<MSODataResponse>, MSODataException *))callback{
    [[request getUrl] appendPathComponent:self.UrlComponent];
    [MSODataBaseContainerHelper addCustomParametersToODataURL:request :[self getCustomParameters] : [self getCustomHeaders]:[self getResolver]];
    
    return [self.Parent oDataExecuteWithRequest:request callback:callback];
}

-(id<MSODataDependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
