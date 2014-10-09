/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "EntityFetcher.h"

@implementation EntityFetcher

-(EntityOperations*) getOperations{
    return (EntityOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent{
    
    return [super initWith:urlComponent :parent :[super.class classForClassName:@"Entity"] :[EntityOperations class]];
}
@end