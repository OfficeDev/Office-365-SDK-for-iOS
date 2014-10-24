/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSExtensionProperty.h"

/**
* The implementation file for type ExtensionProperty.
*/

@implementation MSExtensionProperty	

@synthesize $$__ODataType;

-(id)init{
	self.$$__ODataType = @"#Microsoft.DirectoryServices.ExtensionProperty";
	return self;
}

@end