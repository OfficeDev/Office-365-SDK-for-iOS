/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@protocol MSODataURL

@required
-(void)setBaseUrl : (NSString*)baseUrl;
-(void)appendPathComponent: (NSString*) pathComponent;
-(void)addQueryStringParameter : (NSString*) name : (NSString*) value;
-(NSString*)toString;
                                                    
@end