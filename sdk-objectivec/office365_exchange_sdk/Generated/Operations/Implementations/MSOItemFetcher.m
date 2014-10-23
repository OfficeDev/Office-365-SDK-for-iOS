/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOItemFetcher.h"


/**
* The implementation file for type MSOItemFetcher.
*/


@implementation MSOItemFetcher
-(MSOItemOperations*) getOperations{
	return [[MSOItemOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOItem class]];
}

	
-(MSOMessageFetcher*) asMessage{
	return [[MSOMessageFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSOEventFetcher*) asEvent{
	return [[MSOEventFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
		
-(MSOContactFetcher*) asContact{
	return [[MSOContactFetcher alloc] initWith :self.UrlComponent :self.Parent :nil];
}	
	
@end