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

@synthesize Parent;
@synthesize UrlComponent;

-(id)initOperationWithUrl:(NSString *)urlComponent Parent:(id<MSOODataExecutable>)parent{
    self.UrlComponent = urlComponent;
    self.Parent = parent;
    return self;
}

- (NSURLSessionDataTask *)oDataExecute:(NSString *)path : (NSData *)content : (MSOHttpVerb)verb :(void (^)(id<MSOResponse> ,NSError *error))callback{
    
    NSString* url = [[NSString alloc] initWithFormat:@"%@/%@",self.UrlComponent,path];
    
    return [self.Parent oDataExecute:url :content :verb :callback];
}

-(id<MSODependencyResolver>) getResolver{
    return [self.Parent getResolver];
}

@end
