/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSApplicationFetcher.h"
#import "MSExtensionPropertyCollectionFetcher.h"


/**
* The implementation file for type MSApplicationFetcher.
*/


@implementation MSApplicationFetcher
-(MSApplicationOperations*) getOperations{
	return [[MSApplicationOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSApplication class]];
}

-(MSExtensionPropertyCollectionFetcher*) getextensionProperties{
    return [[MSExtensionPropertyCollectionFetcher alloc] initWith:@"extensionProperties" :self : [MSExtensionProperty class]];
}


@end