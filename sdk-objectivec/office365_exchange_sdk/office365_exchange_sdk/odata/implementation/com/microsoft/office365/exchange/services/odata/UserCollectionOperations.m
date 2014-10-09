/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "UserCollectionOperations.h"

@implementation UserCollectionOperations

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}

		

		
@end