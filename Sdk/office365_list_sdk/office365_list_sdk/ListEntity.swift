//
//  ListEntity.swift
//  office365_list_sdk
//
//  Created by Gustavo on 7/15/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

import Foundation
import office365_base_sdk

class ListEntity: BaseEntity{
    
    var Title : NSString? = "";
    
    /*func setMetadata(data : NSDictionary){
        self.Metadata.Id = data.valueForKey("id") as String;
        self.Metadata.Uri = data.valueForKey("uri") as String;
        self.Metadata.type = data.valueForKey("type") as String;
    }*/
    
    override func createFromJson(data : NSDictionary) -> BaseEntity{
        
       // var metadata = data.valueForKey("__metadata") as NSDictionary;
       // self.setMetadata(metadata);
        
        self.Id = data.valueForKey("Id") as String;
        self.Title = data.valueForKey("Title") as String;
        
        return self;
    }
}