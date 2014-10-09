/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MessageCollectionOperations.h"

@implementation MessageCollectionOperations

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}

@end