//
//  FileDiscoveryClient.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/13/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class FileDiscoveryClient: NSObject{

    let url = "https://api.office.com/discovery/me/services";
    
    func getDiscoveryInfo() -> DiscoveryInformation{
        var credentials = OAuthentication();
        credentials.setToken("");
        var connection = HttpConnection();
        connection.initializeWith(self.url,credentials: credentials);
        connection.execute( "GET");
        
        return DiscoveryInformation();
    }
}