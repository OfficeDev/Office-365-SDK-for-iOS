/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItem.h"

/**
* The implementation file for type Item.
*/

@implementation MSItem	

@synthesize $$__ODataType;

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.Item";
	return self;
}

@end