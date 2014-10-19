/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarGroupOperations.h"
#import "MSOBaseODataContainerHelper.h"

/**
* The implementation file for type MSOCalendarGroupOperations.
*/

@implementation MSOCalendarGroupOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end