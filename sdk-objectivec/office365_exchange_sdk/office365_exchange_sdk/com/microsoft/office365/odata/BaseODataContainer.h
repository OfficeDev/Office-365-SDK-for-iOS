//
//  BaseODataContainer.h
//  office365-exchange-sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODataExecutable.h"

@interface BaseODataContainer : ODataExecutable

-(id)initWith : (NSString *)url : (DependencyResolver*) resolver;

@end