//
//  DependencyResolver.h
//  office365-odata-interfaces
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "HttpTransport.h"
#import "Logger.h"
#import "JsonSerializer.h"
#import "CredentialsFactory.h"

@interface DependencyResolver : NSObject

-(HttpTransport*)getHttpTransport;
-(Logger*) getLogger;
-(JsonSerializer*) getJsonSerializer;
-(CredentialsFactory*) getCredentialsFactory;

@end