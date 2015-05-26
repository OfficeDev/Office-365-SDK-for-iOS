/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "Credentials.h"

@interface OAuthentication : Credentials

@property ()NSString *token;

-(id)initWith : (NSString *)token;
-(void)prepareRequest:(NSMutableURLRequest *)request;
-(NSString*)getToken;

@end