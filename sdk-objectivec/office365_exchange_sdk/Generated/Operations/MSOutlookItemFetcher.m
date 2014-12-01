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
	return [[MSOutlookItemOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOutlookItem class]];
}

-(NSURLSessionDataTask*) updateItem:(id)entity withCallback:(void (^)(MSOutlookItem*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteItem:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}



	
-(MSOutlookMessageFetcher*) asMessage{
	return [[MSOutlookMessageFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSOutlookMessage class]];
}
	
-(MSOutlookEventFetcher*) asEvent{
	return [[MSOutlookEventFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSOutlookEvent class]];
}
	
-(MSOutlookContactFetcher*) asContact{
	return [[MSOutlookContactFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSOutlookContact class]];
}@end