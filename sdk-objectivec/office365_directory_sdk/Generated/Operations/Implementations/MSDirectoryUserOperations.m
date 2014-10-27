/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryUserOperations.h"
#import "MSDirectoryBaseODataContainerHelper.h"

/**
* The implementation file for type MSDirectoryUserOperations.
*/

@implementation MSDirectoryUserOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)assignLicense : (NSMutableArray<MSDirectoryAssignedLicense> *) addLicenses : (NSMutableArray *) removeLicenses : (void (^)(MSDirectoryUser *user, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* params = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :addLicenses,@"addLicenses",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :removeLicenses,@"removeLicenses",nil ],nil];

	NSString* parameters = [MSDirectoryBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"assignLicense(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :GET :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSDirectoryUser * result = (MSDirectoryUser *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSDirectoryUser class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end