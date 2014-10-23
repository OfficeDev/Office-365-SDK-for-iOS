/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOServiceInfoFetcher.h"


/**
* The implementation file for type MSOServiceInfoFetcher.
*/


@implementation MSOServiceInfoFetcher
-(MSOServiceInfoOperations*) getOperations{
	return [[MSOServiceInfoOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOServiceInfo class]];
}


@end