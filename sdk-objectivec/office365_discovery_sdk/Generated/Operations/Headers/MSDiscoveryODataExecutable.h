/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

/**
* The header for type MSDiscoveryODataExecutable.
*/

#import <office365_odata_base/MSDependencyResolver.h>

@protocol MSDiscoveryODataExecutable

@optional
-(id<MSDependencyResolver>) getResolver;
-(NSURLSessionDataTask*) oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb : (void (^)(id<MSResponse>, NSError *))callback;

@required
@property NSString* UrlComponent;
@property id<MSDiscoveryODataExecutable> Parent;

-(NSDictionary*)getCustomParameters;
-(void)addCustomParameters : (NSString*)name : (NSString*)value;

@end

@interface MSDiscoveryODataExecutable : NSObject<MSDiscoveryODataExecutable>

@property NSString* UrlComponent;
@property id<MSDiscoveryODataExecutable> Parent;
@property NSMutableDictionary* CustomParameters;

@end
