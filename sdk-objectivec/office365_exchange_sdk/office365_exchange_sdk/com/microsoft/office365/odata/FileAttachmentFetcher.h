/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "FileAttachmentFetcher.h"

@implementation FileAttachmentFetcher

-(FileAttachmentOperations*) getOperations{
    return (FileAttachmentOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
@end