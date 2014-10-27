/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSHttpVerb.h"

@protocol MSRequest

@required
-(void) setContent : (NSData*) content;
-(NSData*) getContent;
-(NSDictionary*)getHeaders;
-(void)setHeaders :(NSArray*) headers;
-(void)addHeader : (NSString*) name : (NSString*) value;
-(void)removeHeader : (NSString*) name;
-(MSHttpVerb) getVerb;
-(void)setVerb : (MSHttpVerb) httpVerb;
-(void)setUrl : (NSString*) url;
-(NSString*) getUrl;

@end