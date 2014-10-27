//
//  ListClient.m
//  office365-lists-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "ListClient.h"
#import "ListEntity.h"
#import "ListItem.h"
#import "ListField.h"
#import "HttpConnection.h"
#import "Constants.h"
#import "NSString+NSStringExtensions.h"

@implementation ListClient

const NSString *apiUrl = @"/_api/lists";

- (NSURLSessionDataTask *)getLists:(void (^)(NSMutableArray *lists, NSError *error))callback{
    
    NSString *url = [NSString stringWithFormat:@"%@%@", self.Url , apiUrl];
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential url:url];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Get;
    
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        NSMutableArray *array = [NSMutableArray array];
        
        if(error == nil){
            NSMutableArray *listsArray =[self parseDataArray: data];
            for (NSDictionary* value in listsArray) {
                [array addObject: [[ListEntity alloc] initWithDictionary:value]];
            }
        }
        
        callback(array, error);
    }];
}

- (NSURLSessionDataTask *)getList:(NSString *)name callback:(void (^)(ListEntity *list, NSError *))callback{
    
    NSString *url = [NSString stringWithFormat:@"%@%@/GetByTitle('%@')", self.Url , apiUrl, [name urlencode]];
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential url:url];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Get;
    
    return [connection execute:method callback:^(NSData *data, NSURLResponse *response, NSError *error) {
        ListEntity *entity;
        if(error == nil){
            entity = [[ListEntity alloc] initWithJson:data];
        }
        
        callback(entity ,error);
    }];
}

- (NSURLSessionDataTask *)getListItems:(NSString *)name callback:(void (^)(NSMutableArray *listItems, NSError *))callback{
 
    NSString *url = [NSString stringWithFormat:@"%@%@/GetByTitle('%@')/Items", self.Url , apiUrl, [name urlencode]];
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential url:url];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Get;
    
    return [connection execute:method callback:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *array = [NSMutableArray array];

        NSMutableArray *listsItemsArray =[self parseDataArray: data];
        for (NSDictionary* value in listsItemsArray) {
            [array addObject: [[ListItem alloc] initWithDictionary:value]];
        }
        
        callback(array ,error);
    }];
}

- (NSURLSessionDataTask *)getListFields:(NSString *)name callback:(void (^)(NSMutableArray *listFields, NSError *error))callback{
    
    NSString *url = [NSString stringWithFormat:@"%@%@/GetByTitle('%@')/Fields", self.Url , apiUrl, [name urlencode]];
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential url:url];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Get;
    
    return [connection execute:method callback:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *array = [NSMutableArray array];
        
        NSMutableArray *listsItemsArray =[self parseDataArray: data];
        for (NSDictionary* value in listsItemsArray) {
            [array addObject: [[ListField alloc] initWithDictionary:value]];
        }
        
        callback(array ,error);
    }];
}

- (NSURLSessionDataTask *)createList: (ListEntity *) newList : (void (^)(ListEntity *list, NSError *error))callback{
    
    NSString *url = [NSString stringWithFormat:@"%@%@", self.Url , apiUrl];;
    
   
    NSString *json = [[NSString alloc] init];
    json =  @"{'AllowContentTypes': %@,'BaseTemplate': %@,";
    json = [json stringByAppendingString: @"'ContentTypesEnabled': %@, 'Description': '%@', 'Title': '%@'}"];
    
    NSString *formatedJson = [NSString stringWithFormat:json, @"true",@"104" , @"true" , newList.description, newList.title];
    
    NSData *jsonData = [formatedJson dataUsingEncoding: NSUTF8StringEncoding];
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray: jsonData];
                                                                              
    NSString *method = (NSString*)[[Constants alloc] init].Method_Post;
    
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        ListEntity *list;
        
        if(error == nil){
           list = [[ListEntity alloc] initWithJson:data];
        }
        
        callback(list, error);
    }];
}

- (NSURLSessionDataTask *)deleteList: (ListEntity *) deleteList : (void (^)(bool success, NSError *error))callback{
    
    NSString *url = [NSString stringWithFormat:@"%@%@(guid'%@')", self.Url , apiUrl, deleteList.Id];
    
    
    HttpConnection *connection = [[HttpConnection alloc] initWithCredentials:self.Credential
                                                                         url:url
                                                                   bodyArray: nil];
    
    NSString *method = (NSString*)[[Constants alloc] init].Method_Delete;
    
    return [connection execute:method callback:^(NSData  *data, NSURLResponse *reponse, NSError *error) {
        BOOL result = FALSE;
        
        if(error == nil && [data length] == 0 ){
            result = TRUE;
        }
        
        callback(result, error);
    }];
}

/*
 NSMutableDictionary *metadata = [[NSMutableDictionary alloc] init];
 [metadata setValue:@"SP.List" forKey:@"type"];
 
 
 NSMutableDictionary *payload = [[NSMutableDictionary alloc] init];
 [payload setObject:metadata forKey:@"_metadata"];
 [payload setValue:@"true" forKey:@"AllowContentTypes"];
 [payload setValue:[NSNumber numberWithInteger: 104] forKey:@"BaseTemplate"];
 [payload setValue:@"true" forKey:@"ContentTypesEnabled"];
 [payload setValue:newList.description forKey:@"Description"];
 [payload setValue:newList.title forKey:@"Title"];
 
 NSArray *array = [[NSArray alloc] initWithObjects:payload, nil];
 
 NSData *myData = [NSJSONSerialization dataWithJSONObject:array
 options:NSJSONWritingPrettyPrinted
 error:nil];
 */
//NSData *myData = [NSKeyedArchiver archivedDataWithRootObject:payload];
/*
 NSString *json = [NSJSONSerialization JSONObjectWithData:myData
 options: NSJSONReadingMutableContainers
 error:nil];
 
 myData = [NSJSONSerialization JSONObjectWithData:json
 options: NSJSONReadingMutableContainers
 error:nil];
 */
//NSData *body = [NSKeyedArchiver archivedDataWithRootObject:payload];

/*
 {
 '_metadata':{'type':SP.List},
 'AllowContentTypes': true,
 'BaseTemplate': 104,
 'ContentTypesEnabled': true,
 'Description': 'My list description',
 'Title': 'RestTest'
 }
 */

- (NSMutableArray *)parseDataArray:(NSData *)data{
    
    NSMutableArray *array = [NSMutableArray array];
    
    NSError *error ;
    
    NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:[self sanitizeJson:data]
                                                               options: NSJSONReadingMutableContainers
                                                                 error:&error];
    
    NSArray *jsonArray = [[jsonResult valueForKey : @"d"] valueForKey : @"results"];
    
    if(jsonArray != nil){
        for (NSDictionary *value in jsonArray) {
            [array addObject: value];
        }
    }else{
        NSDictionary *jsonItem =[jsonResult valueForKey : @"d"];
        
        if(jsonItem != nil){
            [array addObject:jsonItem];
        }
    }
    
    return array;
}

/* HACK to avoid an error when serializing json with unsupported NSDecimal type.
 
 For more info refer to: http://stackoverflow.com/questions/18650365/valid-json-but-cocoa-error-3840-from-afnetworking-nsjsonserialization
 
 */

- (NSData*) sanitizeJson : (NSData*) data{
    NSString * dataString = [[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSString* replacedDataString = [dataString stringByReplacingOccurrencesOfString:@"E+308" withString:@"E+127"];
    
    NSData* bytes = [replacedDataString dataUsingEncoding:NSUTF8StringEncoding];
    
    return bytes;
}
@end