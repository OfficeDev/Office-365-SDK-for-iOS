//
//  MSOOAuthCredentials.h
//  office365_odata_impl
//
//  Created by Gustavo on 10/15/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_interfaces.h>

@interface MSOAuthCredentials : NSObject<MSCredentials>

-(void)addToken : (NSString*) token;

@end
