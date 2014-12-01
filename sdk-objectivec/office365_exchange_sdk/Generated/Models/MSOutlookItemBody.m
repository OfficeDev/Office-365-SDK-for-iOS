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

#import "MSOutlookItemBody.h"

/**
* The implementation file for type ItemBody.
*/

@implementation MSOutlookItemBody	

-(id)init{
	self.$$__ODataType = @"#Microsoft.OutlookServices.ItemBody";
	return self;
}


-(void)setContentTypeString:(NSString*)value{
	if([value isEqualToString:@"Text"]){
        self.ContentType = Text;
    }
	if([value isEqualToString:@"HTML"]){
        self.ContentType = HTML;
    }
}
@end