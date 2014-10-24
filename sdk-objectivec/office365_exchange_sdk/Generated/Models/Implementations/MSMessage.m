/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSMessage.h"

/**
* The implementation file for type Message.
*/

@implementation MSMessage	

@synthesize $$__ODataType;

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.Message";
	return self;
}

@end