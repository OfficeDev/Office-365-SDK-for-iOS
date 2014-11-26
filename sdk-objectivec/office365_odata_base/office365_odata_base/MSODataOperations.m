/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataOperations.h"

@implementation MSODataOperations

-(id)initOperationWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    return self;
}

-(NSURLSessionDataTask *)oDataExecuteForPath:(id<MSODataURL>)path withContent:(NSData *)content andMethod:(MSODataHttpVerb)verb andCallback:(void (^)(id<MSODataResponse>, NSError *))callback{
    
    [path appendPathComponent:self.UrlComponent];
    [MSODataBaseContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];
   
    return [self.Parent oDataExecuteForPath:path withContent:content andMethod:verb andCallback : callback];
}

-(id<MSODataDependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
