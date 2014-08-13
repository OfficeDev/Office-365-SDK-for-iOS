//
//  BaseEntity.m
//  office365-base-sdk
//
//  Created by Gustavo on 7/21/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity

NSDictionary *jsonData;

- (instancetype) initWithJson:(NSData *)jsonData{
    NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:jsonData
                                                               options: NSJSONReadingMutableContainers
                                                                 error:nil];
    
    NSDictionary *jsonItem =[jsonResult valueForKey : @"d"];
    
    if(jsonItem == nil){
        return nil;
    }
    
    return [self initWithDictionary:jsonItem];
}

- (instancetype) initWithDictionary:(NSDictionary *)dictionary{

    [self createFromJson:dictionary];
    return self;
}


-(void) createMetadata : (NSDictionary *) data{
    self.Metadata = [[Metadata alloc] initWith:data];
}

- (BaseEntity *)createFromJson:(NSDictionary *)data{
    NSDictionary *metadata = [data valueForKey : @"__metadata"];
    
    [self createMetadata : metadata];
    
    self.Id =[data valueForKey: @"Id"];
    jsonData = data;
    return self;
}

-(NSObject*) getData:(NSString *)name{
    return [jsonData valueForKey:name];
}


@end