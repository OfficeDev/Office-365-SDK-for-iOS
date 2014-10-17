//
//  ListClient.h
//  office365-lists-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <office365-base-sdk/BaseClient.h>
#import "ListEntity.h"

@interface ListClient : BaseClient

- (NSURLSessionDataTask *)getLists:(void (^)(NSMutableArray *lists, NSError *error))callback;
- (NSURLSessionDataTask *)getList:(NSString *)name callback:(void (^)(ListEntity *list, NSError *error))callback;
- (NSURLSessionDataTask *)getListItems:(NSString *)name callback:(void (^)(NSMutableArray *listItems, NSError *error))callback;
- (NSURLSessionDataTask *)getListFields:(NSString *)name callback:(void (^)(NSMutableArray *listFields, NSError *error))callback;
- (NSURLSessionDataTask *)createList: (ListEntity *) newList : (void (^)(ListEntity *list, NSError *error))callback;
- (NSURLSessionDataTask *)deleteList: (ListEntity *) deleteList : (void (^)(BOOL success, NSError *error))callback;
@end
