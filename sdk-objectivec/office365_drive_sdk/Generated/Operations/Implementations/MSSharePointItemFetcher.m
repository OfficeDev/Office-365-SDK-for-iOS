/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointItemFetcher.h"


/**
* The implementation file for type MSSharePointItemFetcher.
*/


@implementation MSSharePointItemFetcher
-(MSSharePointItemOperations*) getOperations{
	return [[MSSharePointItemOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSSharePointItem class]];
}

	
-(MSSharePointFileFetcher*) asFile{
	return [[MSSharePointFileFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSSharePointFile class]];
}	
		
-(MSSharePointFolderFetcher*) asFolder{
	return [[MSSharePointFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSSharePointFolder class]];
}	
	
@end