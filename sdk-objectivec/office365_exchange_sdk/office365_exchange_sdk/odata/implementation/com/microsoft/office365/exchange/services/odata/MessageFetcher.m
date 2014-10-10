/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MessageFetcher.h"

@implementation MessageFetcher

@synthesize Parent;
-(MessageOperations*) getOperations{
    return [[MessageOperations alloc] initOperationWithUrl:@"" Parent:self.Parent];//(MessageOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent :(Class)clazz :(Class)operationClazz{
    self.Parent = parent;
    return [super initWith:urlComponent :parent :[Message class] :[MessageOperations class]];
}
//-(AttachmentCollectionFetcher*) getAttachments{
//    return nil;//[[AttachmentCollectionFetcher alloc] initWith:@"Attachments" :self :[super.class classForClassName:@"Attachment"]  : [AttachmentCollectionOperations class]];
//}
@end