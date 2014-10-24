/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFolder.h"

/**
* The implementation file for type Folder.
*/

@implementation MSFolder	

@synthesize $$__ODataType;

-(id)init{
	self.$$__ODataType = @"#Microsoft.FileServices.Folder";
	return self;
}

@end