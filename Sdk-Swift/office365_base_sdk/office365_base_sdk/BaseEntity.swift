//
//  BaseEntity.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/17/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class BaseEntity: NSObject{

    var Id : String = "";
    
    var Metadata : MetaData = MetaData();
    var Properties : NSMutableDictionary = NSMutableDictionary();
    
    func createFromJson(data : NSDictionary) -> BaseEntity{
        return self;
    }
    
    func getPropertyValue(name : NSString) -> NSString{
        return self.Properties.valueForKey(name) as NSString;
    }
    
    func setAditionalProperties(properties : NSArray, data : NSDictionary){
        for property : AnyObject in properties{
            var stringProperty = property as NSString;
            self.Properties.setObject(data.valueForKey(stringProperty), forKey: stringProperty);
        }
    }
}

class MetaData : NSObject{

    var Id : String = "";
    var Uri : String = "";
    var type : String = "";
}