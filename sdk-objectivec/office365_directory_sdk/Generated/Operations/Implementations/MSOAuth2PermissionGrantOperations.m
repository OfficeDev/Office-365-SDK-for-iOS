/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAuth2PermissionGrantOperations.h"

/**
* The implementation file for type MSOAuth2PermissionGrantOperations.
*/

@implementation MSOAuth2PermissionGrantOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end