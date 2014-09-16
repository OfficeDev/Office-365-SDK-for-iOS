//
//  FileEntity.swift
//  office365-files-sdk
//
//  Created by Lagash on 6/23/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//
import Foundation
import office365_base_sdk

class FileEntity : BaseEntity{

    var Name : NSString? = "";
    var Url : NSString? = "";
    var TimeLastModified : NSArray<BaseEntity> = "";
    var TimeCreated : NSString? = "";
    var Size : Int = 0;
    
    func setMetadata(data : NSDictionary){
        self.Metadata.Id = data.valueForKey("id") as String;
        self.Metadata.Uri = data.valueForKey("uri") as String;
        self.Metadata.type = data.valueForKey("type") as String;
    }
    
    override func createFromJson(data : NSDictionary) -> BaseEntity{
        
        var metadata = data.valueForKey("__metadata") as NSDictionary;
        self.setMetadata(metadata);
        
        self.Id = data.valueForKey("Id") as String;
        self.Name = data.valueForKey("Name") as String;
        self.Url = data.valueForKey("Url") as String;
        self.TimeLastModified = data.valueForKey("TimeLastModified") as String;
        self.TimeCreated = data.valueForKey("TimeCreated") as String;
        self.Size  = data.valueForKey("Size") as Int;
        
        return self;
    }
    
    func isFolder() -> Bool{
        return self.Metadata.type == "MS.FileServices.Folder";
    }
}