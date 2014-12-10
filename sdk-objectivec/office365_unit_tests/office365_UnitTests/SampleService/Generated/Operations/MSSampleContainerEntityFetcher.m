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

#import "MSSampleContainerEntityFetcher.h"


/**
* The implementation file for type MSSampleContainerEntityFetcher.
*/


@implementation MSSampleContainerEntityFetcher

-(MSSampleContainerEntityOperations*) getOperations{
	return [[MSSampleContainerEntityOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSSampleContainerEntity class]];
}

-(NSURLSessionDataTask*) updateEntity:(id)entity withCallback:(void (^)(MSSampleContainerEntity*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteEntity:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}



	
-(MSSampleContainerAnotherEntityFetcher*) asAnotherEntity{
	return [[MSSampleContainerAnotherEntityFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSSampleContainerAnotherEntity class]];
}
	
-(MSSampleContainerSampleEntityFetcher*) asSampleEntity{
	return [[MSSampleContainerSampleEntityFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSSampleContainerSampleEntity class]];
}@end