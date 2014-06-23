//
//  DiscoveryInformation.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/13/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class DiscoveryInformation: BaseEntity{
    var ServiceName : String = "";
    var ServiceResourceId: String = "";
    var Capability : String = "";
    var ServiceEndpointUri: String = "";
    
    override func createFromJson(data : NSDictionary) -> BaseEntity{
        self.Capability = data.valueForKey("Capability") as String;
        self.ServiceName = data.valueForKey("ServiceName") as String;
        self.ServiceEndpointUri = data.valueForKey("ServiceEndpointUri") as String;
        self.ServiceResourceId = data.valueForKey("ServiceResourceId") as String;
        //dinformation.Id = diccionary.valueForKey("id") as String;
        
        return self;
    }
}