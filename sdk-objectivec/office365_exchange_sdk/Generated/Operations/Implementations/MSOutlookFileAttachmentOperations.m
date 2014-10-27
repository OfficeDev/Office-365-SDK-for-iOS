/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFileAttachmentOperations.h"

/**
* The implementation file for type MSOutlookFileAttachmentOperations.
*/

@implementation MSOutlookFileAttachmentOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end