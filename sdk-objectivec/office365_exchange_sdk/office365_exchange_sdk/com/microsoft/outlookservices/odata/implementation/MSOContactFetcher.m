/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactFetcher.h"


/**
* The implementation file for type MSOContactFetcher.
*/

@implementation MSOContactFetcher

-(MSOContactOperations*) getOperations{
    return (MSOContactOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOContact class]];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(MSOContact *mSOContact, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

@end