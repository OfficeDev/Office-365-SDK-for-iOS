//
//  ExchangeClient.m
//  office365-exchange-sdk
//
//  Created by Gustavo on 8/21/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "ExchangeClient.h"
#import <office365-base-sdk/HttpConnection.h>
#import "jsonparser/JsonParser.h"
#import "Message.h"

@implementation ExchangeClient 


- (NSURLSessionDataTask *)getMessages :(void (^)(NSMutableArray *messages, NSError *error))callback{
    
    NSString *url =  [NSString stringWithFormat:@"%@%@", self.Url ,@"/Inbox/Messages"];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential url:url];
    
    return [connection execute:@"GET" callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        NSMutableArray *array = [NSMutableArray array];
        
        JsonParser *parser = [[JsonParser alloc] init];
        if(error == nil){
            
            NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];
            
            array =  [parser parseWithData:data forType:Message.class selector:selectors];
        }
        
        callback(array, error);
    }];
}
@end