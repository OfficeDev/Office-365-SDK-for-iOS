/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSODataHttpVerb.h"
#import "MSODataUrl.h"

@protocol MSODataRequest

@required
-(void) setContent : (NSData*) content;
-(NSData*) getContent;
-(NSDictionary*)getHeaders;
-(void)setHeaders :(NSArray*) headers;
-(void)addHeader : (NSString*) name : (NSString*) value;
-(void)removeHeader : (NSString*) name;
-(MSODataHttpVerb) getVerb;
-(void)setVerb : (MSODataHttpVerb) httpVerb;
-(void)setUrl : (id<MSODataURL>) url;
-(id<MSODataURL>) getUrl;

@end