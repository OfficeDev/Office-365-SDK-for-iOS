/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesFileFetcher.h"


/**
* The implementation file for type MSFilesFileFetcher.
*/


@implementation MSFilesFileFetcher
-(MSFilesFileOperations*) getOperations{
	return [[MSFilesFileOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSFilesFile class]];
}


@end