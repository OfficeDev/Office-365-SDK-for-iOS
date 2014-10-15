/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOMessageFetcher.h"
#import "MSOAttachmentCollectionFetcher.h"


/**
* The implementation file for type MSOMessageFetcher.
*/

@implementation MSOMessageFetcher

-(MSOMessageOperations*) getOperations{
    return (MSOMessageOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOMessage class]];
}

-(NSURLSessionDataTask *)oDataExecute:(NSString *)path :(NSData *)content :(MSOHttpVerb)verb :(void (^)(id<MSOResponse>, NSError *))callback{
    
   return [self.Parent oDataExecute:path :content :verb :callback];
}

-(NSURLSessionDataTask *)execute:(void (^)(MSOMessage *mSOMessage, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MSOAttachmentCollectionFetcher*) getAttachments{
	NSString* path = [[NSString alloc]initWithFormat:@"%@/%@", self.UrlComponent, @"Attachments" ];
  
    return [[MSOAttachmentCollectionFetcher alloc] initWith:path :self : [MSOAttachment class]];
}

@end