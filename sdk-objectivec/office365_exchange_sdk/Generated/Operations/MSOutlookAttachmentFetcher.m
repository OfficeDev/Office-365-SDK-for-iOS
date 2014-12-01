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

#import "MSOutlookAttachmentFetcher.h"


/**
* The implementation file for type MSOutlookAttachmentFetcher.
*/


@implementation MSOutlookAttachmentFetcher

-(MSOutlookAttachmentOperations*) getOperations{
	return [[MSOutlookAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOutlookAttachment class]];
}

-(NSURLSessionDataTask*) updateAttachment:(id)entity withCallback:(void (^)(MSOutlookAttachment*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteAttachment:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}



	
-(MSOutlookFileAttachmentFetcher*) asFileAttachment{
	return [[MSOutlookFileAttachmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSOutlookFileAttachment class]];
}
	
-(MSOutlookItemAttachmentFetcher*) asItemAttachment{
	return [[MSOutlookItemAttachmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSOutlookItemAttachment class]];
}@end