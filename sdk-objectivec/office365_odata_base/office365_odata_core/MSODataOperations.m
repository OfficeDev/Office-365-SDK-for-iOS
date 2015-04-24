/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataOperations.h"
#import "MSODataBaseContainerHelper.h"
#import "MSODataRequest.h"
#import "MSODataURL.h"

@implementation MSODataOperations

@synthesize urlComponent = _urlComponent;
@synthesize parent = _parent;

- (instancetype)initOperationWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent {
    
    if (self = [super initWithUrl:urlComponent parent:parent asClass:nil]) {
      
        _urlComponent = urlComponent;
        _parent = parent;
    }
    
    return self;
}

- (NSURLSessionTask *)oDataExecuteRequest:(id<MSODataRequest>)request
                                     callback:(void (^)(id<MSODataResponse> response, MSODataException *exception))callback {
    
    [request.url appendPathComponent:_urlComponent];
    
    [MSODataBaseContainerHelper addCustomParametersToODataURLWithRequest:request
                                                              parameters:self.customParameters
                                                                 headers:self.customHeaders
                                                      dependencyResolver:self.resolver];
    
    return [self.parent oDataExecuteRequest:request callback:callback];
}

@end