/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItemOperations.h"

/**
* The implementation file for type MSItemOperations.
*/

@implementation MSItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end