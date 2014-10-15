/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOItemAttachmentFetcher.h"
#import "MSOItemFetcher.h"


/**
* The implementation file for type MSOItemAttachmentFetcher.
*/

@implementation MSOItemAttachmentFetcher

-(MSOItemAttachmentOperations*) getOperations{
    return (MSOItemAttachmentOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOItemAttachment class]];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(MSOItemAttachment *mSOItemAttachment, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MSOItemFetcher*) getItem{
	 return [[MSOItemFetcher alloc] initWith:@"Item" :self : [MSOItem class]];
}

@end