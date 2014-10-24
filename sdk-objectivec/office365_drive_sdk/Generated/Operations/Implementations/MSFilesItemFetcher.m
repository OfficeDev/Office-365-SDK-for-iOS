/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesItemFetcher.h"


/**
* The implementation file for type MSFilesItemFetcher.
*/


@implementation MSFilesItemFetcher
-(MSFilesItemOperations*) getOperations{
	return [[MSFilesItemOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSFilesItem class]];
}

	
-(MSFilesFileFetcher*) asFile{
	return [[MSFilesFileFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSFilesFolderFetcher*) asFolder{
	return [[MSFilesFolderFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
	
@end