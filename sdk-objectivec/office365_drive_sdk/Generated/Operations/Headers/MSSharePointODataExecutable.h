/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

/**
* The header for type MSSharePointODataExecutable.
*/


#import <office365_odata_base/MSDependencyResolver.h>

@protocol MSSharePointODataExecutable

@optional

-(id<MSDependencyResolver>) getResolver;
-(NSURLSessionDataTask*) oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb : (void (^)(id<MSResponse>, NSError *))callback;

@required

@property NSString* UrlComponent;
@property id<MSSharePointODataExecutable> Parent;

-(NSDictionary*)getCustomParameters;
-(void)addCustomParameters : (NSString*)name : (NSString*)value;

@end

@interface MSSharePointODataExecutable : NSObject<MSSharePointODataExecutable>

@property NSString* UrlComponent;
@property id<MSSharePointODataExecutable> Parent;
@property NSMutableDictionary* CustomParameters;

@end
