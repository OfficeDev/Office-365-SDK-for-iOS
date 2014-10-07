/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataEntityFetcher.h"
#import "AttachmentsCollectionFetcher.h"

@interface MessageFetcher : ODataEntityFetcher

-(MessageOperations*) getOperations;

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(AttachmentCollectionFetcher*) getAttachments;
@end