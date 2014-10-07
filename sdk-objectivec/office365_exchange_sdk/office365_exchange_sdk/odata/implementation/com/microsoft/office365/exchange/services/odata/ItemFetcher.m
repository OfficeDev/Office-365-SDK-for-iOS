/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ItemFetcher.h"

@implementation ItemFetcher

-(ItemOperations*) getOperations{
    return (ItemOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[Item class] :[ItemOperations class]];
}
@end