/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSUserOperations.h"

/**
* The implementation file for type MSUserOperations.
*/

@implementation MSUserOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)assignLicense : (NSMutableArray<MSAssignedLicense> *) addLicenses : (NSMutableArray *) removeLicenses : (void (^)(MSUser *user, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* params = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :addLicenses,@"addLicenses",nil ],
	[[NSDictionary alloc] initWithObjectsAndKeys :removeLicenses,@"removeLicenses",nil ],nil];

	NSString* parameters = [MSBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"assignLicense(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :GET :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSUser * result = (MSUser *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSUser class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end