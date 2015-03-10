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

#import "MSOutlookODataEntities.h"

@implementation MSOutlookFolderFetcher

-(MSOutlookFolderOperations*) getOperations{
	return [[MSOutlookFolderOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOutlookFolder class]];
}

-(NSURLSessionTask*) updateFolder:(id)entity withCallback:(void (^)(MSOutlookFolder*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteFolder:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSOutlookFolderCollectionFetcher*) getChildFolders{
    return [[MSOutlookFolderCollectionFetcher alloc] initWithUrl:@"ChildFolders" parent:self andEntityClass:[MSOutlookFolder class]];
}

-(id<MSOutlookFolderFetcher>) getChildFoldersById : (NSString*)_id{
    return [[[MSOutlookFolderCollectionFetcher alloc] initWithUrl:@"ChildFolders" parent:self andEntityClass:[MSOutlookFolder class]] getById:_id];
}
-(MSOutlookMessageCollectionFetcher*) getMessages{
    return [[MSOutlookMessageCollectionFetcher alloc] initWithUrl:@"Messages" parent:self andEntityClass:[MSOutlookMessage class]];
}

-(id<MSOutlookMessageFetcher>) getMessagesById : (NSString*)_id{
    return [[[MSOutlookMessageCollectionFetcher alloc] initWithUrl:@"Messages" parent:self andEntityClass:[MSOutlookMessage class]] getById:_id];
}

@end