/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "AttachmentFetcher.h"

@implementation AttachmentFetcher

-(AttachmentOperations*) getOperations{
    return (AttachmentOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
@end