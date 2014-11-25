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

#import "MSOOutlookAttachmentFetcher.h"


/**
* The implementation file for type MSOOutlookAttachmentFetcher.
*/


@implementation MSOOutlookAttachmentFetcher

-(MSOOutlookAttachmentOperations*) getOperations{
	return [[MSOOutlookAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOOutlookAttachment class]];
}



	
-(MSOOutlookFileAttachmentFetcher*) asFileAttachment{
	return [[MSOOutlookFileAttachmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSOOutlookItemAttachmentFetcher*) asItemAttachment{
	return [[MSOOutlookItemAttachmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}@end