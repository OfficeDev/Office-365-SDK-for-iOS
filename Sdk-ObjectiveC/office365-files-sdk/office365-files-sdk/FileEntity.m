//
//  FileEntity.m
//  office365-files-sdk
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
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