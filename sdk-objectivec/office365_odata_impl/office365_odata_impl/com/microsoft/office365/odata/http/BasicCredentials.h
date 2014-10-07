//
//  BasicCredentials.h
//  office365_odata_impl
//
//  Created by Gustavo on 10/7/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <office365_odata_interfaces/Credentials.h>

@interface BasicCredentials : Credentials

-(void)addToken : (NSString*) token;

@end
