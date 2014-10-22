/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFileOperations.h"

/**
* The implementation file for type MSOFileOperations.
*/

@implementation MSOFileOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSOFile *file, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :destFolderId,@"destFolderId",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :destFolderPath,@"destFolderPath",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :newName,@"newName",nil ],nil];

	NSData* payload = [[MSOBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"Copy"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			MSOFile * result = (MSOFile *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSOFile class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)uploadContent : (NSStream *) contentStream : (void (^)(int returnValue, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

			NSArray* parameters = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :contentStream,@"contentStream",nil ],nil];

	NSData* payload = [[MSOBaseODataContainerHelper generatePayload:parameters :[self getResolver]]dataUsingEncoding:NSUTF8StringEncoding];
	[url appendPathComponent:@"UploadContent"];
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			int result = (int)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : nil];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)content : (void (^)(NSStream *stream, NSError *error))callback{

	id<MSOODataURL> url = [[self getResolver] createODataURL];

			
	//NSString* parameters = [MSOBaseODataContainerHelper getFuntionParameters: params];
	//[url appendPathComponent:[NSString alloc] initWithFormat:@"Content(%@)",parameters];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :POST :^(id<MSOResponse> r, NSError *error) {
        
       if(error == nil){
			NSStream * result = (NSStream *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [NSStream class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end