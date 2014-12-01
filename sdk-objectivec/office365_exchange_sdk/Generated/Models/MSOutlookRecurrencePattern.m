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

#import "MSOutlookRecurrencePattern.h"

/**
* The implementation file for type RecurrencePattern.
*/

@implementation MSOutlookRecurrencePattern	

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.RecurrencePattern";
	return self;
}


-(void)setTypeString:(NSString*)value{
	if([value isEqualToString:@"Daily"]){
        self.Type = Daily;
    }
	if([value isEqualToString:@"Weekly"]){
        self.Type = Weekly;
    }
	if([value isEqualToString:@"AbsoluteMonthly"]){
        self.Type = AbsoluteMonthly;
    }
	if([value isEqualToString:@"RelativeMonthly"]){
        self.Type = RelativeMonthly;
    }
	if([value isEqualToString:@"AbsoluteYearly"]){
        self.Type = AbsoluteYearly;
    }
	if([value isEqualToString:@"RelativeYearly"]){
        self.Type = RelativeYearly;
    }
}

-(void)setFirstDayOfWeekString:(NSString*)value{
	if([value isEqualToString:@"Sunday"]){
        self.FirstDayOfWeek = Sunday;
    }
	if([value isEqualToString:@"Monday"]){
        self.FirstDayOfWeek = Monday;
    }
	if([value isEqualToString:@"Tuesday"]){
        self.FirstDayOfWeek = Tuesday;
    }
	if([value isEqualToString:@"Wednesday"]){
        self.FirstDayOfWeek = Wednesday;
    }
	if([value isEqualToString:@"Thursday"]){
        self.FirstDayOfWeek = Thursday;
    }
	if([value isEqualToString:@"Friday"]){
        self.FirstDayOfWeek = Friday;
    }
	if([value isEqualToString:@"Saturday"]){
        self.FirstDayOfWeek = Saturday;
    }
}

-(void)setIndexString:(NSString*)value{
	if([value isEqualToString:@"First"]){
        self.Index = First;
    }
	if([value isEqualToString:@"Second"]){
        self.Index = Second;
    }
	if([value isEqualToString:@"Third"]){
        self.Index = Third;
    }
	if([value isEqualToString:@"Fourth"]){
        self.Index = Fourth;
    }
	if([value isEqualToString:@"Last"]){
        self.Index = Last;
    }
}
@end