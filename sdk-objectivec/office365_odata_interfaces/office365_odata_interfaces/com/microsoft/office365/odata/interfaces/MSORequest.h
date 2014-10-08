/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSOHttpVerb.h"

@protocol MSORequest

@required
-(void) setContent : (NSData*) content;
-(NSData*) getContent;
-(NSArray*)getHeaders;
-(void)setHeaders :(NSArray*) headers;
-(void)addHeader : (NSString*) name : (NSString*) value;
-(void)removeHeader : (NSString*) name;
-(MSOHttpVerb) getVerb;
-(void)setVerb : (MSOHttpVerb) httpVerb;
-(void)setUrl : (NSString*) url;
-(NSString*) getUrl;

@end