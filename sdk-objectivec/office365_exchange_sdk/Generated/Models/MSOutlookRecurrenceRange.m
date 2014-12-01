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

#import "MSOutlookRecurrenceRange.h"

/**
* The implementation file for type RecurrenceRange.
*/

@implementation MSOutlookRecurrenceRange	

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.RecurrenceRange";
	return self;
}


-(void)setTypeString:(NSString*)value{
	if([value isEqualToString:@"EndDate"]){
        self.Type = EndDate;
    }
	if([value isEqualToString:@"NoEnd"]){
        self.Type = NoEnd;
    }
	if([value isEqualToString:@"Numbered"]){
        self.Type = Numbered;
    }
}
@end