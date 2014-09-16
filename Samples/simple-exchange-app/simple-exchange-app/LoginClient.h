//
//  LoginClient.h
//  office365-base-sdk
//
//  Created by Lagash on 8/7/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ADALiOS/ADAuthenticationContext.h>
#import <ADALiOS/ADAuthenticationParameters.h>
#import <ADALiOS/ADAuthenticationSettings.h>
#import <ADALiOS/ADLogger.h>
#import <ADALiOS/ADInstanceDiscovery.h>

@interface LoginClient : NSObject

-(id)initWithParameters: (NSString *)cliId :(NSString *)returnUrl :(NSString *)resId :(NSString *)authority;

-(void)clearCredentials : (NSError*__autoreleasing*) e;

-(void) login: (BOOL) clearCache completionHandler:(void (^) (NSString* token, NSError *error))completionBlock;
@end	