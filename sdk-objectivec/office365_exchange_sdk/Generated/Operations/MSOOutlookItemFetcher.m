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

#import "MSOOutlookItemFetcher.h"


/**
* The implementation file for type MSOOutlookItemFetcher.
*/


@implementation MSOOutlookItemFetcher

-(MSOOutlookItemOperations*) getOperations{
	return [[MSOOutlookItemOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOOutlookItem class]];
}



	
-(MSOOutlookMessageFetcher*) asMessage{
	return [[MSOOutlookMessageFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOOutlookEventFetcher*) asEvent{
	return [[MSOOutlookEventFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOOutlookContactFetcher*) asContact{
	return [[MSOOutlookContactFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}@end