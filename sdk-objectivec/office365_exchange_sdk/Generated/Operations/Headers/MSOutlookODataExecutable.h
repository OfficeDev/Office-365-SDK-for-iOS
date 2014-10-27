/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

/**
* The header for type MSOutlookODataExecutable.
*/


#import <office365_odata_base/MSDependencyResolver.h>

@protocol MSOutlookODataExecutable

@required
@property NSString* UrlComponent;
@property id<MSOutlookODataExecutable> Parent;


-(id<MSDependencyResolver>) getResolver;
-(NSURLSessionDataTask*) oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb : (void (^)(id<MSResponse>, NSError *))callback;
-(NSDictionary*)getCustomParameters;
-(void)addCustomParameters : (NSString*)name : (NSString*)value;

@end

@interface MSOutlookODataExecutable : NSObject<MSOutlookODataExecutable>

@property NSString* UrlComponent;
@property id<MSOutlookODataExecutable> Parent;
@property NSMutableDictionary* CustomParameters;

@end
