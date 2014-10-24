/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItemFetcher.h"


/**
* The implementation file for type MSItemFetcher.
*/


@implementation MSItemFetcher
-(MSItemOperations*) getOperations{
	return [[MSItemOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSItem class]];
}

	
-(MSFileFetcher*) asFile{
	return [[MSFileFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSFolderFetcher*) asFolder{
	return [[MSFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
	
@end