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

#import "MSOutlookResponseStatus.h"

/**
* The implementation file for type ResponseStatus.
*/

@implementation MSOutlookResponseStatus	

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.ResponseStatus";
	return self;
}


-(void)setResponseString:(NSString*)value{
	if([value isEqualToString:@"None"]){
        self.Response = None;
    }
	if([value isEqualToString:@"Organizer"]){
        self.Response = Organizer;
    }
	if([value isEqualToString:@"TentativelyAccepted"]){
        self.Response = TentativelyAccepted;
    }
	if([value isEqualToString:@"Accepted"]){
        self.Response = Accepted;
    }
	if([value isEqualToString:@"Declined"]){
        self.Response = Declined;
    }
	if([value isEqualToString:@"NotResponded"]){
        self.Response = NotResponded;
    }
}
@end