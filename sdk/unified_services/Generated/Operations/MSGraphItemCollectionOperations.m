/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/
#import "MSGraphItemCollectionOperations.h"
#import "MSGraphFetchers.h"

/**
* The implementation file for type MSGraphItemCollectionOperations.
*/

@implementation MSGraphItemCollectionOperations

- (void)addWithPath:(NSString *)path nameConflict:(NSString *)nameConflict type:(NSString *)type content:(NSStream *)content callback:(void (^)(MSGraphItem *item, MSOrcError *error))callback {

	
	NSString *pathString = [self.resolver.jsonSerializer serialize:path property:@"path"];
	NSString *nameConflictString = [self.resolver.jsonSerializer serialize:nameConflict property:@"nameConflict"];
	NSString *typeString = [self.resolver.jsonSerializer serialize:type property:@"type"];
	NSString *contentString = [self.resolver.jsonSerializer serialize:content property:@"content"];

	return [self addRawWithPath:pathString nameConflict:nameConflictString type:typeString content:contentString callback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			MSGraphItem * result = (MSGraphItem *)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:[MSGraphItem class]];
            
			callback(result, e);
        }
        else {

            callback(nil, e);
        }
    }];
}

- (void)addRawWithPath:(NSString *) path nameConflict:(NSString *) nameConflict type:(NSString *) type content:(NSString *) content callback:(void (^)(NSString *item, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSArray *parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :path,@"path", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys :nameConflict,@"nameConflict", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys :type,@"type", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys :content,@"content", nil], nil];

	NSData* payload = [[MSOrcBaseContainer generatePayloadWithParameters:parameters dependencyResolver:self.resolver] dataUsingEncoding:NSUTF8StringEncoding];

	[request setContent:payload];



	[request.url appendPathComponent:@"add"];
	[request setContent:payload];

	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
		
		if (e == nil) {

            callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
		

- (void)getByPathWithPath:(NSString *)path callback:(void (^)(MSGraphItem *item, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:path,@"path",nil];


	NSString *parameters = [MSOrcBaseContainer getFunctionParameters:params];
	
	[request.url appendPathComponent:[[NSString alloc] initWithFormat:@"getByPath(%@)",parameters]];
		
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e){

       if (e == nil) {

			MSGraphItem * result = (MSGraphItem *)[super.resolver.jsonSerializer deserialize:response.data asClass:[MSGraphItem class]];
            callback(result, e);
        }
        else {

            callback(nil, e);
        }
    }];
}		
@end