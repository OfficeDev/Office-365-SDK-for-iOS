//
//  BaseClient.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/17/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class BaseClient : NSObject{
    
    var Credential : Credentials;
    var Url : NSString;
    
    init(url : NSString ,credentials : Credentials){
        
        self.Credential = credentials;
        self.Url = url;
    }
    
    var data: NSMutableData = NSMutableData();
    
    func parseData(data : NSData) -> NSMutableArray{

        return NSMutableArray();
    }
}