/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointItemOperations.h"

/**
* The implementation file for type MSSharePointItemOperations.
*/

@implementation MSSharePointItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end