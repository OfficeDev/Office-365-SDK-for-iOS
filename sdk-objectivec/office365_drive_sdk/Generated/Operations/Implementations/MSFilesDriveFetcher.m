/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesDriveFetcher.h"


/**
* The implementation file for type MSFilesDriveFetcher.
*/


@implementation MSFilesDriveFetcher
-(MSFilesDriveOperations*) getOperations{
	return [[MSFilesDriveOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSFilesDrive class]];
}


@end