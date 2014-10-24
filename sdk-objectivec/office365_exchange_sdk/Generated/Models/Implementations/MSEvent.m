/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSEvent.h"

/**
* The implementation file for type Event.
*/

@implementation MSEvent	

@synthesize $$__ODataType;

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.Event";
	return self;
}

@end