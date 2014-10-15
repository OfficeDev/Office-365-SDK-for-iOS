/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFolderOperations.h"

/**
* The implementation file for type MSOFolderOperations.
*/

@implementation MSOFolderOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOFolder *folder, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"Copy" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOFolder *folder, NSError *error))callback{

    NSURLSessionDataTask* task = [self oDataExecute:@"Move" :nil :POST :^(id<MSOResponse> result, NSError *error) {
        
       if(error == nil){
            callback([result getData], error);
        }
        else{
            callback(nil, error);
        }
    }];
    
    return task;
}			

@end