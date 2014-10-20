/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_base/MSODependencyResolver.h>

/**
* The header for type MSOODataExecutable.
*/

@protocol MSOODataExecutable

@property NSString* UrlComponent;
@property id<MSOODataExecutable> Parent;

-(id<MSODependencyResolver>) getResolver;
-(NSURLSessionDataTask*) oDataExecute:(id<MSOODataURL>)path :(NSData *)content :(MSOHttpVerb)verb : (void (^)(id<MSOResponse>, NSError *))callback;
-(NSDictionary*)getCustomParameters;
-(void)addCustomParameters : (NSString*)name : (NSString*)value;

@end

@interface MSOODataExecutable : NSObject<MSOODataExecutable>

@property NSString* UrlComponent;
@property id<MSOODataExecutable> Parent;
@property NSMutableDictionary* CustomParameters;

@end
