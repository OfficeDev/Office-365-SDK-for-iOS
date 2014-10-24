/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

/**
* The header for type MSFilesODataExecutable.
*/


#import <office365_odata_base/MSODependencyResolver.h>

@protocol MSFilesODataExecutable

@required
@property NSString* UrlComponent;
@property id<MSFilesODataExecutable> Parent;


-(id<MSODependencyResolver>) getResolver;
-(NSURLSessionDataTask*) oDataExecute:(id<MSFilesODataURL>)path :(NSData *)content :(MSFilesHttpVerb)verb : (void (^)(id<MSFilesResponse>, NSError *))callback;
-(NSDictionary*)getCustomParameters;
-(void)addCustomParameters : (NSString*)name : (NSString*)value;

@end

@interface MSFilesODataExecutable : NSObject<MSFilesODataExecutable>

@property NSString* UrlComponent;
@property id<MSFilesODataExecutable> Parent;
@property NSMutableDictionary* CustomParameters;

@end
