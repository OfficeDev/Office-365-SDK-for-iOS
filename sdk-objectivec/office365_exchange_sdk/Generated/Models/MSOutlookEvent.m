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

#import "MSOutlookEvent.h"

/**
* The implementation file for type Event.
*/

@implementation MSOutlookEvent	

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.Event";
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
-(void)setShowAsString:(NSString*)value{
	if([value isEqualToString:@"Free"]){
        self.ShowAs = Free;
    }
	if([value isEqualToString:@"Tentative"]){
        self.ShowAs = Tentative;
    }
	if([value isEqualToString:@"Busy"]){
        self.ShowAs = Busy;
    }
	if([value isEqualToString:@"Oof"]){
        self.ShowAs = Oof;
    }
	if([value isEqualToString:@"WorkingElsewhere"]){
        self.ShowAs = WorkingElsewhere;
    }
	if([value isEqualToString:@"Unknown"]){
        self.ShowAs = Unknown;
    }
}
-(void)setTypeString:(NSString*)value{
	if([value isEqualToString:@"SingleInstance"]){
        self.Type = SingleInstance;
    }
	if([value isEqualToString:@"Occurrence"]){
        self.Type = Occurrence;
    }
	if([value isEqualToString:@"Exception"]){
        self.Type = Exception;
    }
	if([value isEqualToString:@"SeriesMaster"]){
        self.Type = SeriesMaster;
    }
}
@end