/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookAttachmentOperations.h"

/**
* The implementation file for type MSOutlookAttachmentOperations.
*/

@implementation MSOutlookAttachmentOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end