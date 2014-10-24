/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSUser.h"

/**
* The implementation file for type User.
*/

@implementation MSUser	

@synthesize $$__ODataType;

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.User";
	return self;
}

@end