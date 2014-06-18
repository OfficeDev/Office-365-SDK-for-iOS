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
}