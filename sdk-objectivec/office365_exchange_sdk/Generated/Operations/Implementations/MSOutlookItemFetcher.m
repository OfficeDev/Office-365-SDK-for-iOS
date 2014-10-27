/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookItemFetcher.h"


/**
* The implementation file for type MSOutlookItemFetcher.
*/


@implementation MSOutlookItemFetcher
-(MSOutlookItemOperations*) getOperations{
	return [[MSOutlookItemOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookItem class]];
}

	
-(MSOutlookMessageFetcher*) asMessage{
	return [[MSOutlookMessageFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookMessage class]];
}	
		
-(MSOutlookEventFetcher*) asEvent{
	return [[MSOutlookEventFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookEvent class]];
}	
		
-(MSOutlookContactFetcher*) asContact{
	return [[MSOutlookContactFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSOutlookContact class]];
}	
	
@end