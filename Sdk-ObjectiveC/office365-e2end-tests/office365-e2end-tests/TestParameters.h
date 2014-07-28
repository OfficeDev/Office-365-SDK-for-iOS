//
//  TestParameters.h
//  office365-e2end-tests
//
//  Created by Gustavo on 7/23/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "office365-base-sdk/OAuthentication.h"

@interface TestParameters : NSObject

@property NSString* ServiceUrl;
@property OAuthentication* Credentials;

@end