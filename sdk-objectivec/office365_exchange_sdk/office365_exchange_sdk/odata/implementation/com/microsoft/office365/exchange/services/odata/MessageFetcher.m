/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MessageFetcher.h"

@implementation MessageFetcher

-(MessageOperations*) getOperations{
    return (MessageOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[super.class classForClassName:@"Message"] :[MessageOperations class]];
}
//-(AttachmentCollectionFetcher*) getAttachments{
//    return nil;//[[AttachmentCollectionFetcher alloc] initWith:@"Attachments" :self :[super.class classForClassName:@"Attachment"]  : [AttachmentCollectionOperations class]];
//}
@end