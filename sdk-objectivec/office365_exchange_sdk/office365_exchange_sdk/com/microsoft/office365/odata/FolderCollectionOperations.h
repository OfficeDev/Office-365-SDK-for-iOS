//
//  FolderCollectionOperations.h
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FolderCollectionOperations

@end

@interface FolderCollectionOperations : ODataOperations

-(id)initWith : (NSString*) urlComponent : (ODataExecutable*) parent;

@end