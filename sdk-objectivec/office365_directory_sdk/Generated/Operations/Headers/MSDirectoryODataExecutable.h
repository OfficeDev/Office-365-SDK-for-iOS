/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

/**
* The header for type MSDirectoryODataExecutable.
*/


#import <office365_odata_base/MSDependencyResolver.h>

@protocol MSDirectoryODataExecutable

@optional
-(id<MSDependencyResolver>) getResolver;
-(NSURLSessionDataTask*) oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb : (void (^)(id<MSResponse>, NSError *))callback;

@required

@property NSString* UrlComponent;
@property id<MSDirectoryODataExecutable> Parent;

-(NSDictionary*)getCustomParameters;
-(void)addCustomParameters : (NSString*)name : (NSString*)value;

@end

@interface MSDirectoryODataExecutable : NSObject<MSDirectoryODataExecutable>

@property NSString* UrlComponent;
@property id<MSDirectoryODataExecutable> Parent;
@property NSMutableDictionary* CustomParameters;

@end
