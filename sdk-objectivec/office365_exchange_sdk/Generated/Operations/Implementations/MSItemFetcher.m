/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItemFetcher.h"


/**
* The implementation file for type MSItemFetcher.
*/


@implementation MSItemFetcher
-(MSItemOperations*) getOperations{
	return [[MSItemOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSItem class]];
}

	
-(MSMessageFetcher*) asMessage{
	return [[MSMessageFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSMessage class]];
}	
		
-(MSEventFetcher*) asEvent{
	return [[MSEventFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSEvent class]];
}	
		
-(MSContactFetcher*) asContact{
	return [[MSContactFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
	
@end