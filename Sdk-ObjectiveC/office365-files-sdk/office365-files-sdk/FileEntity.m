//
//  FileEntity.m
//  office365-files-sdk
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "FileEntity.h"

@implementation FileEntity

- (BaseEntity *)createFromJson:(NSDictionary *)data{
    
    NSDictionary *metadata = [data valueForKey : @"__metadata"];
    
    [super createMetadata : metadata];
    
    self.Id = [data valueForKey : @"Id"];
    self.Name = [data valueForKey : @"Name"];
    self.Url = [data valueForKey : @"Url"];
    self.TimeLastModified = [data valueForKey : @"TimeLastModified"];
    self.TimeCreated = [data valueForKey : @"TimeCreated" ];
    self.Size = [[data valueForKey : @"Size"] intValue];
    
    return self;
}

- (BOOL)isFolder{
    return [self.Metadata.type  isEqual: @"MS.FileServices.Folder"];
}

@end