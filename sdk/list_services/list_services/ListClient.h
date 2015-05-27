/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseClient.h"
#import "ListEntity.h"

@interface ListClient : BaseClient

- (NSURLSessionDataTask *)getLists:(void (^)(NSMutableArray *lists, NSError *error))callback;
- (NSURLSessionDataTask *)getList:(NSString *)name callback:(void (^)(ListEntity *list, NSError *error))callback;
- (NSURLSessionDataTask *)getListItems:(NSString *)name callback:(void (^)(NSMutableArray *listItems, NSError *error))callback;
- (NSURLSessionDataTask *)getListFields:(NSString *)name callback:(void (^)(NSMutableArray *listFields, NSError *error))callback;
- (NSURLSessionDataTask *)createList: (ListEntity *) newList : (void (^)(ListEntity *list, NSError *error))callback;
- (NSURLSessionDataTask *)deleteList: (ListEntity *) deleteList : (void (^)(BOOL success, NSError *error))callback;
@end
