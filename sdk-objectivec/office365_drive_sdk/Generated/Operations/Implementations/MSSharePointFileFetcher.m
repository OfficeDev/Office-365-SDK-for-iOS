/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointFileFetcher.h"


/**
* The implementation file for type MSSharePointFileFetcher.
*/


@implementation MSSharePointFileFetcher
-(MSSharePointFileOperations*) getOperations{
	return [[MSSharePointFileOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSSharePointFile class]];
}


@end