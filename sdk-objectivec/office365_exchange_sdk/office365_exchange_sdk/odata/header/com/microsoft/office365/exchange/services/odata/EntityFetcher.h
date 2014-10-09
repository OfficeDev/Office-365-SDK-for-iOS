/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataEntityFetcher.h"
#import "EntityOperations.h"

@interface EntityFetcher : ODataEntityFetcher

-(EntityOperations*) getOperations;

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent;
@end