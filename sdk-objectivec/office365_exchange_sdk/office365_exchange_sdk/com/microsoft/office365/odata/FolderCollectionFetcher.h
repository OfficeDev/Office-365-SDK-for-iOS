//
//  FolderCollectionFetcher.h
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODataCollectionFetcher.h"
#import "Folder.h"
#import "FolderFetcher.h"
#import "FolderCollectionOperations.h"

@interface FolderCollectionFetcher : ODataCollectionFetcher

-(id)initWith : (NSString *)urlComponent : (ODataExecutable*) parent : (Class) clazz : (Class) operationClazz;

@end