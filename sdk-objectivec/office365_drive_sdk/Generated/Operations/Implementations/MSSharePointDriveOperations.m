/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointDriveOperations.h"

/**
* The implementation file for type MSSharePointDriveOperations.
*/

@implementation MSSharePointDriveOperations

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end