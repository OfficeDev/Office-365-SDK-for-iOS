//
//  LogInSerivce.h
//  simple-exchange-app
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ADALiOS/ADAuthenticationContext.h>
#import <ADALiOS/ADAuthenticationParameters.h>
#import <ADALiOS/ADAuthenticationSettings.h>
#import <ADALiOS/ADLogger.h>
#import <ADALiOS/ADInstanceDiscovery.h>


@interface LogInSerivce : NSObject

-(void) getToken : (BOOL) clearCache completionHandler:(void (^) (NSString*))completionBlock;

-(NSString*)getTokenString;

-(BOOL)isAuthenticated;
@end
