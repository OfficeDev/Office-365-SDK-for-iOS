//
//  FileClient.m
//  office365-files-sdk
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "FileClient.h"
#import "office365-base-sdk/NSString+NSStringExtensions.h"
#import <office365-base-sdk/HttpConnection.h>
#import <office365-base-sdk/Constants.h>

@implementation FileClient

const NSString *apiUrl = @"/_api/files";

- (NSURLSessionDataTask *)createFolder:(NSString *)name parentFolder:(NSString *)parentFolder callback:(void (^)(FileEntity *folder, NSError *error))callback{
    
    NSString *url;
    
    if(parentFolder == nil){
        url = [NSString stringWithFormat:@"%@%@", self.Url , apiUrl];
    }
    else{
        url = [NSString stringWithFormat:@"%@%@('%@/%@')", self.Url , apiUrl, [parentFolder urlencode], [name urlencode]];
    }
    
    NSString *metadata = [NSString stringWithFormat:@"{Name:'%@'}", name];
    NSData *body = [metadata dataUsingEncoding:NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Post;
    
    return [connection execute:method callback:^(NSData *data, NSURLResponse *response, NSError *error) {
        FileEntity *file = [[FileEntity alloc] init];
        
        NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data
                                                                   options: NSJSONReadingMutableContainers
                                                                     error:nil];
        
        NSDictionary *jsonArray = [jsonResult valueForKey : @"d"];
        
        if(error == nil){
            [file createFromJson: jsonArray];
        }
        
        callback(file, error);
    }];
}

- (NSURLSessionDataTask *)createEmptyFile:(NSString *)name folder:(NSString *)folder callback:(void (^)(FileEntity *file, NSError * error))callback{
    
    NSString* url;
    
    if(folder == nil){
        url = [NSString stringWithFormat:@"%@%@/Add(name='%@',overwrite='true')", self.Url , apiUrl,name];
    }
    else{
        url = [NSString stringWithFormat:@"%@%@/Add(name='%@/%@',overwrite='true')", self.Url , apiUrl, [folder urlencode], [name urlencode]];
    }
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:nil];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Post;
    
    return [connection execute:method callback:^(NSData *data, NSURLResponse *response, NSError *error) {
        FileEntity *file = [[FileEntity alloc] init];
        
        NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data
                                                                   options: NSJSONReadingMutableContainers
                                                                     error:nil];
        
        NSDictionary *jsonArray = [jsonResult valueForKey : @"d"];
        
        if(error == nil){
            [file createFromJson: jsonArray];
        }
        
        callback(file, error);
    }];
}

- (NSURLSessionDataTask *)createFile:(NSString *)name overwrite:(BOOL)overwrite body:(NSData *)body folder:(NSString *)folder : (void (^)(FileEntity *file, NSError *error))callback{
    
    NSString *url;
    if(folder == nil){
        url = [NSString stringWithFormat:@"%@%@/Add(name='%@',overwrite='%@')", self.Url , apiUrl,name,overwrite ? @"true" : @"false"];
    }
    else{
        url = [NSString stringWithFormat:@"%@%@/Add(name='%@/%@',overwrite='%@')", self.Url , apiUrl,[folder urlencode],[name urlencode],overwrite ? @"true" : @"false"];
    }
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray:body];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Post;
    
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        FileEntity *file = [[FileEntity alloc] init];
        
        NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data
                                                                   options: NSJSONReadingMutableContainers
                                                                     error:nil];
        
        NSDictionary *jsonArray = [jsonResult valueForKey : @"d"];
        
        if(error == nil){
            [file createFromJson: jsonArray];
            // array = [self parseData : data];
        }
        
        callback(file, error);
    }];
}

- (NSURLSessionDataTask *)getFiles:(void (^)(NSMutableArray *files, NSError *error))callback{
    return [self getFiles:nil callback:callback];
}

- (NSURLSessionDataTask *)getFiles:(NSString *)folder callback :(void (^)(NSMutableArray *files, NSError *))callback{
    
    NSString *url;
    
    if(folder == nil){
        url = [NSString stringWithFormat:@"%@%@", self.Url , apiUrl];
    }
    else{
        url = [NSString stringWithFormat:@"%@%@('%@')/Children", self.Url , apiUrl, [folder urlencode]];
    }
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential url:url];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Get;
    
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        NSMutableArray *array = [NSMutableArray array];
        
        if(error == nil){
            array = [self parseData : data];
        }
        
        callback(array, error);
    }];
}

- (NSURLSessionDataTask *)getFileById:(NSString *)fId callback :(void (^)(FileEntity *file, NSError *error))callback{
    
    NSString *url = [NSString stringWithFormat:@"%@%@('%@')", self.Url , apiUrl, [fId urlencode]];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential url:url ];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Get;
   
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
            FileEntity *file = [[FileEntity alloc] init];
            
            NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data
                                                                       options: NSJSONReadingMutableContainers
                                                                         error:nil];
            
            NSDictionary *jsonArray = [jsonResult valueForKey : @"d"];
            
            if(error == nil){
                [file createFromJson: jsonArray];
            }
            
            callback(file, error);
    }];
}

- (NSURLSessionDownloadTask *)download:(NSString *)name delegate:(id <NSURLSessionDelegate>)delegate{
    
    NSString *url = [NSString stringWithFormat:@"%@%@('%@')/download", self.Url , apiUrl, name];
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential url:url];
    NSString *method = (NSString*)[[Constants alloc] init].Method_Get;
    
    return [connection download:method delegate:delegate];
}

- (NSURLSessionDataTask *)delete:(NSString *)name callback:(void (^)(NSString *status, NSError *error))callback{
    
    NSString *url = [NSString stringWithFormat:@"%@%@('%@')", self.Url , apiUrl, [name urlencode]];
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential url:url];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Delete;
   
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        callback(@"Ok", error);
    }];
}

- (NSURLSessionDataTask *)copy:(NSString *)name destinationFolder:(NSString *)destinationFolder callback:(void (^)(NSString * status, NSError * error))callback{
    
    NSString *url = [NSString stringWithFormat:@"%@%@('%@')/CopyTo(target='%@/%@',overwrite=true)", self.Url , apiUrl, [name urlencode], [destinationFolder urlencode],[name urlencode]];
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Post;
    
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        callback(@"Ok", error);
    }];
}

- (NSURLSessionDataTask *)move:(NSString *)name destinationFolder:(NSString *)destinationFolder callback:(void (^)(NSString *responseCode, NSError *error))callback{
    
    NSString *url = [NSString stringWithFormat:@"%@%@('%@')/MoveTo(target='%@/%@',overwrite=true)", self.Url , apiUrl, [name urlencode], [destinationFolder urlencode], [name urlencode]];
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Post;
    
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        
        callback(@"Ok", error);
    }];
}

- (NSMutableArray *)parseData:(NSData *)data{
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data
                                                               options: NSJSONReadingMutableContainers error:nil];
    
    NSArray *jsonArray = [[jsonResult valueForKey : @"d"] valueForKey : @"results"];
    
    for (NSDictionary *value in jsonArray) {
        FileEntity *file = [[FileEntity alloc] init];
        [file createFromJson:value];
        [array addObject:file];
    }
    
    return array;
}

@end