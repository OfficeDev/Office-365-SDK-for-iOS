//
//  ODataCollectionFetcher.h
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODataExecutable.h"
#import "ODataEntityFetcher.h"
#import "ODataOperations.h"

@interface ODataCollectionFetcher : ODataExecutable<NSObject, ODataEntityFetcher, ODataOperations>

@end
