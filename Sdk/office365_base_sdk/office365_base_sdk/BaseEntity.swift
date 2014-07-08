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
    
    func createFromJson(data : NSDictionary) -> BaseEntity{
        return self;
    }
}

class MetaData : NSObject{

    var Id : String = "";
    var Uri : String = "";
    var type : String = "";
}
