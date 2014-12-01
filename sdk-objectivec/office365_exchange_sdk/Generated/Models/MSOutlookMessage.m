/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOutlookMessage.h"

/**
* The implementation file for type Message.
*/

@implementation MSOutlookMessage	

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.Message";
	return self;
}


-(void)setImportanceString:(NSString*)value{
	if([value isEqualToString:@"Low"]){
        self.Importance = Low;
    }
	if([value isEqualToString:@"Normal"]){
        self.Importance = Normal;
    }
	if([value isEqualToString:@"High"]){
        self.Importance = High;
    }
}
@end