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

-(NSURLSessionDataTask*)oDataExecuteWithPath:(id<MSODataURL>)path andContent : (NSData *)content andVerb : (MSODataHttpVerb)verb andWithCallback :(void (^)(id<MSODataResponse> ,NSError *error))callback{
    [path appendPathComponent:self.UrlComponent];
    [MSODataBaseContainerHelper addCustomParametersToODataURL:path :[self getCustomParameters]:[self getResolver]];
   
    return [self.Parent oDataExecuteForPath:path withContent:content andMethod:verb andCallback : callback];
}

-(id<MSODataDependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
