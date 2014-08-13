//
//  FileEntity.h
//  office365-files-sdk
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <office365-base-sdk/BaseEntity.h>

@interface FileEntity : BaseEntity

@property (nonatomic) NSString *Name;
@property (nonatomic) NSString *Url;
@property (nonatomic) NSString *TimeLastModified;
@property (nonatomic) NSString *TimeCreated;
@property (nonatomic) int Size;

- (BaseEntity *)createFromJson:(NSDictionary *)data;
- (BOOL)isFolder;

@end