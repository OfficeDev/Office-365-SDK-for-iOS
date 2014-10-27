/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookAttachmentFetcher.h"


/**
* The implementation file for type MSOutlookAttachmentFetcher.
*/


@implementation MSOutlookAttachmentFetcher
-(MSOutlookAttachmentOperations*) getOperations{
	return [[MSOutlookAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookAttachment class]];
}

	
-(MSOutlookFileAttachmentFetcher*) asFileAttachment{
	return [[MSOutlookFileAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookFileAttachment class]];
}	
		
-(MSOutlookItemAttachmentFetcher*) asItemAttachment{
	return [[MSOutlookItemAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookItemAttachment class]];
}	
	
@end