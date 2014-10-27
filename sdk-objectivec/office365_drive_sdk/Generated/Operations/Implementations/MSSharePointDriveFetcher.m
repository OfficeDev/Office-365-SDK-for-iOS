/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointDriveFetcher.h"


/**
* The implementation file for type MSSharePointDriveFetcher.
*/


@implementation MSSharePointDriveFetcher
-(MSSharePointDriveOperations*) getOperations{
	return [[MSSharePointDriveOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSSharePointDrive class]];
}


@end