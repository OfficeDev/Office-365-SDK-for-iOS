/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAttachmentFetcher.h"


/**
* The implementation file for type MSOAttachmentFetcher.
*/


@implementation MSOAttachmentFetcher
-(MSOAttachmentOperations*) getOperations{
	return [[MSOAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOAttachment class]];
}

	
-(MSOFileAttachmentFetcher*) asFileAttachment{
	return [[MSOFileAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSOItemAttachmentFetcher*) asItemAttachment{
	return [[MSOItemAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
	
@end