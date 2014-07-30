//
//  OAuthentication.h
//  office365-base-sdk
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "Credentials.h"

@interface OAuthentication : Credentials

@property ()NSString *token;

-(id)initWith : (NSString *)token;
-(void)prepareRequest:(NSMutableURLRequest *)request;
-(NSString*)getToken;

@end