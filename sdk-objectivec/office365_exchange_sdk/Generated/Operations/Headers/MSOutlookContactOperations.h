/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookContact.h"
#import "MSOutlookItemOperations.h"
#import "MSOutlookEmailAddress.h"
#import "MSOutlookPhysicalAddress.h"

/**
* The header for type MSOutlookContactOperations.
*/


@interface MSOutlookContactOperations : MSOutlookItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

@end