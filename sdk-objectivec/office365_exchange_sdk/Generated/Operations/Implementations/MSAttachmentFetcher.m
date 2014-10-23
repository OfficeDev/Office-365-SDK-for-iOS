/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSAttachmentFetcher.h"


/**
* The implementation file for type MSAttachmentFetcher.
*/


@implementation MSAttachmentFetcher
-(MSAttachmentOperations*) getOperations{
	return [[MSAttachmentOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSAttachment class]];
}

	
-(MSFileAttachmentFetcher*) asFileAttachment{
	return [[MSFileAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSItemAttachmentFetcher*) asItemAttachment{
	return [[MSItemAttachmentFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
	
@end