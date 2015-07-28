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
#import "MSOutlookFetchers.h"

/**
* The implementation file for type MSOutlookMessageOperations.
*/

@implementation MSOutlookMessageOperations

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent {
 
    return [super initOperationWithUrl:urlComponent parent:parent];
}

- (void)copyWithDestinationId:(NSString *)destinationId callback:(void (^)(MSOutlookMessage *message, MSOrcError *error))callback {
	
	NSString *destinationIdString = [self.resolver.jsonSerializer serialize:destinationId property:@"DestinationId"];
	return [self copyRawWithDestinationId:destinationIdString callback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			MSOutlookMessage * result = (MSOutlookMessage *)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:[MSOutlookMessage class]];
            callback(result, e);
        } 
		else {

            callback(nil, e);
        }
    }];
}

- (void)copyRawWithDestinationId:(NSString *) destinationId callback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSArray *parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId", nil], nil];

	NSData* payload = [[MSOrcBaseContainer generatePayloadWithParameters:parameters dependencyResolver:self.resolver] dataUsingEncoding:NSUTF8StringEncoding];

	[request setContent:payload];


	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.Copy"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
- (void)moveWithDestinationId:(NSString *)destinationId callback:(void (^)(MSOutlookMessage *message, MSOrcError *error))callback {
	
	NSString *destinationIdString = [self.resolver.jsonSerializer serialize:destinationId property:@"DestinationId"];
	return [self moveRawWithDestinationId:destinationIdString callback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			MSOutlookMessage * result = (MSOutlookMessage *)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:[MSOutlookMessage class]];
            callback(result, e);
        } 
		else {

            callback(nil, e);
        }
    }];
}

- (void)moveRawWithDestinationId:(NSString *) destinationId callback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSArray *parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId", nil], nil];

	NSData* payload = [[MSOrcBaseContainer generatePayloadWithParameters:parameters dependencyResolver:self.resolver] dataUsingEncoding:NSUTF8StringEncoding];

	[request setContent:payload];


	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.Move"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
- (void)createReplyWithCallback:(void (^)(MSOutlookMessage *message, MSOrcError *error))callback {
	
	return [self createReplyRawWithCallback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			MSOutlookMessage * result = (MSOutlookMessage *)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:[MSOutlookMessage class]];
            callback(result, e);
        } 
		else {

            callback(nil, e);
        }
    }];
}

- (void)createReplyRawWithCallback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	

	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.CreateReply"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
- (void)createReplyAllWithCallback:(void (^)(MSOutlookMessage *message, MSOrcError *error))callback {
	
	return [self createReplyAllRawWithCallback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			MSOutlookMessage * result = (MSOutlookMessage *)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:[MSOutlookMessage class]];
            callback(result, e);
        } 
		else {

            callback(nil, e);
        }
    }];
}

- (void)createReplyAllRawWithCallback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	

	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.CreateReplyAll"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
- (void)createForwardWithCallback:(void (^)(MSOutlookMessage *message, MSOrcError *error))callback {
	
	return [self createForwardRawWithCallback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			MSOutlookMessage * result = (MSOutlookMessage *)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:[MSOutlookMessage class]];
            callback(result, e);
        } 
		else {

            callback(nil, e);
        }
    }];
}

- (void)createForwardRawWithCallback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	

	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.CreateForward"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
- (void)replyWithComment:(NSString *)comment callback:(void (^)(int returnValue, MSOrcError *error))callback {
	
	NSString *commentString = [self.resolver.jsonSerializer serialize:comment property:@"Comment"];
	return [self replyRawWithComment:commentString callback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			int result = (int)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:nil];
            callback(result, e);
        } 
		else {

            callback((int)[returnValue integerValue], e);
        }
    }];
}

- (void)replyRawWithComment:(NSString *) comment callback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSArray *parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment", nil], nil];

	NSData* payload = [[MSOrcBaseContainer generatePayloadWithParameters:parameters dependencyResolver:self.resolver] dataUsingEncoding:NSUTF8StringEncoding];

	[request setContent:payload];


	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.Reply"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
- (void)replyAllWithComment:(NSString *)comment callback:(void (^)(int returnValue, MSOrcError *error))callback {
	
	NSString *commentString = [self.resolver.jsonSerializer serialize:comment property:@"Comment"];
	return [self replyAllRawWithComment:commentString callback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			int result = (int)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:nil];
            callback(result, e);
        } 
		else {

            callback((int)[returnValue integerValue], e);
        }
    }];
}

- (void)replyAllRawWithComment:(NSString *) comment callback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSArray *parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment", nil], nil];

	NSData* payload = [[MSOrcBaseContainer generatePayloadWithParameters:parameters dependencyResolver:self.resolver] dataUsingEncoding:NSUTF8StringEncoding];

	[request setContent:payload];


	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.ReplyAll"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
- (void)forwardWithComment:(NSString *)comment toRecipients:(NSArray *)toRecipients callback:(void (^)(int returnValue, MSOrcError *error))callback {
	
	NSString *commentString = [self.resolver.jsonSerializer serialize:comment property:@"Comment"];
	NSString *toRecipientsString = [self.resolver.jsonSerializer serialize:toRecipients property:@"ToRecipients"];
	return [self forwardRawWithComment:commentString toRecipients:toRecipientsString callback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			int result = (int)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:nil];
            callback(result, e);
        } 
		else {

            callback((int)[returnValue integerValue], e);
        }
    }];
}

- (void)forwardRawWithComment:(NSString *) comment toRecipients:(NSString *) toRecipients callback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSArray *parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :comment,@"Comment", nil],
                          [[NSDictionary alloc] initWithObjectsAndKeys :toRecipients,@"ToRecipients", nil], nil];

	NSData* payload = [[MSOrcBaseContainer generatePayloadWithParameters:parameters dependencyResolver:self.resolver] dataUsingEncoding:NSUTF8StringEncoding];

	[request setContent:payload];


	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.Forward"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
- (void)sendWithCallback:(void (^)(int returnValue, MSOrcError *error))callback {
	
	return [self sendRawWithCallback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			int result = (int)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:nil];
            callback(result, e);
        } 
		else {

            callback((int)[returnValue integerValue], e);
        }
    }];
}

- (void)sendRawWithCallback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	

	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.Send"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
@end