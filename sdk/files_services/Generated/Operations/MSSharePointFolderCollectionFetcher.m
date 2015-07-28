/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/
#import "MSSharePointFetchers.h"

/**
* The implementation file for type MSSharePointFolderCollectionFetcher.
*/

@implementation MSSharePointFolderCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent {

    return [super initWithUrl:urlComponent parent:parent asClass:[MSSharePointFolder class]];
}

- (void)add:(MSSharePointFolder*)entity callback:(void (^)(MSSharePointFolder *folder, MSOrcError *error))callback {
	
	return [super add:entity callback:^(id entityAdded, MSOrcError *e) {

        callback(entityAdded,e);
    }];
}

- (MSSharePointFolderFetcher *)getById:(NSString *)id {

    return [[MSSharePointFolderFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,id] parent:self];
}

- (MSSharePointFolderCollectionFetcher *)select:(NSString *)params {
    [super select:params];
    
    return self;
}

- (MSSharePointFolderCollectionFetcher *)filter:(NSString *)params{
    [super filter:params];
    
    return self;
}

- (MSSharePointFolderCollectionFetcher *)search:(NSString *)params {
    [super search:params];
    
    return self;
}

- (MSSharePointFolderCollectionFetcher *)top:(int)value {
    [super top:value];
    
    return self;
}

- (MSSharePointFolderCollectionFetcher *)skip:(int)value {
    [super skip:value];
    
    return self;
}

- (MSSharePointFolderCollectionFetcher *)expand:(NSString *)value {
    [super expand:value];
    
    return self;
}

- (MSSharePointFolderCollectionFetcher *)orderBy:(NSString *)params {
    [super orderBy:params];
    
    return self;
}

- (MSSharePointFolderCollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value {
    [super addCustomParametersWithName:name value:value];
    
    return self;
}

- (MSSharePointFolderCollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value {
    [super addCustomHeaderWithName:name value:value];
    
    return self;
}

@end