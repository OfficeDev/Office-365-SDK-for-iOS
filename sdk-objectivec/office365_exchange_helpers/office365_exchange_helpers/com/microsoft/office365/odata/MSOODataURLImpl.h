//
//  ODataURLImpl.h
//  office365_exchange_helpers
//
//  Created by Gustavo on 10/16/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <office365_odata_interfaces/MSOODataURL.h>
#import <office365_odata_interfaces/MSODependencyResolver.h>

@interface MSOODataURLImpl : NSObject<MSOODataURL>

-(NSString*) toString;

@end