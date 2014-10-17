/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCurrentUserRequestContextFetcher.h"
#import "MSODriveFetcher.h"
#import "MSOItemCollectionFetcher.h"


/**
* The implementation file for type MSOCurrentUserRequestContextFetcher.
*/

@implementation MSOCurrentUserRequestContextFetcher

-(MSOCurrentUserRequestContextOperations*) getOperations{
	return [[MSOCurrentUserRequestContextOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOCurrentUserRequestContext class]];
}

-(MSODriveFetcher*) getdrive{
	 return [[MSODriveFetcher alloc] initWith:@"drive" :self : [MSODrive class]];
}

-(MSOItemCollectionFetcher*) getfiles{
    return [[MSOItemCollectionFetcher alloc] initWith:@"files" :self : [MSOItem class]];
}

@end