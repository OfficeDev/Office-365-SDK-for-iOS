//
//  UserOperations.m
//  office365_exchange_sdk
//
//  Created by Gustavo on 10/3/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "UserOperations.h"
#import "Message.h"
@implementation UserOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    return [super initWith:urlComponent :parent];
}

-(NSURLSessionDataTask*)sendMail : (Message* )message : (BOOL) saveToSentItems :(void (^)(int d, NSError *error))callback{
    
    NSURLSessionDataTask* task = [self oDataExecute:@"SendMail" :nil :POST :^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil){
            NSString* entityString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
            id result = [[[self getResolver]getJsonSerializer] deserialize:entityString :message.class];
            callback(result, error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}

@end
