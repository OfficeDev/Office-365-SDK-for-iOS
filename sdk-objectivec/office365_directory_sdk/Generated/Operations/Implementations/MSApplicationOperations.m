/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSApplicationOperations.h"

/**
* The implementation file for type MSApplicationOperations.
*/

@implementation MSApplicationOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)restore : (NSMutableArray *) identifierUris : (void (^)(MSApplication *application, NSError *error))callback{

	id<MSODataURL> url = [[self getResolver] createODataURL];

			NSArray* params = [[NSArray alloc] initWithObjects:
	[[NSDictionary alloc] initWithObjectsAndKeys :identifierUris,@"identifierUris",nil ],nil];

	NSString* parameters = [MSBaseODataContainerHelper getFunctionParameters: params];
	[url appendPathComponent:[[NSString alloc] initWithFormat:@"restore(%@)",parameters]];
	NSData* payload = nil;
		
	NSURLSessionDataTask* task = [super oDataExecute:url :payload :GET :^(id<MSResponse> r, NSError *error) {
        
       if(error == nil){
			MSApplication * result = (MSApplication *)[[[self getResolver]getJsonSerializer] deserialize:[r getData] : [MSApplication class]];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end