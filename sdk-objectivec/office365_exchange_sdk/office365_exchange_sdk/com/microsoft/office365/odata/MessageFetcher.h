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

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(AttachmentCollectionFetcher*) getAttachments;
@end