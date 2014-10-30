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

#import "MSOutlookItemFetcher.h"


/**
* The implementation file for type MSOutlookItemFetcher.
*/


@implementation MSOutlookItemFetcher
-(MSOutlookItemOperations*) getOperations{
	return [[MSOutlookItemOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent{
    
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