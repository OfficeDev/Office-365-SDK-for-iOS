//
//  NSString+NSStringExtensions.h
//  office365_exchange_helpers
//
//  Created by Gustavo on 10/16/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_interfaces.h>

@interface NSString (NSStringExtensions)
- (NSString *)urlencode;
@end