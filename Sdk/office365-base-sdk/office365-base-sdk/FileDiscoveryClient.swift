//
//  FileDiscoveryClient.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/13/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class FileDiscoveryClient: BaseClient{
    
    func getDiscoveryInfo(credentials : Credentials) -> DiscoveryInformation{
     
        var connection = HttpConnection();
        connection.initializeWith("https://api.office.com/discovery/me/services",credentials: credentials);
        connection.execute(Constants.Method_Get, client: self);
        
        return DiscoveryInformation();
    }
    
    override func connectionDidFinishLoading(connection: NSURLConnection!) {
        var dataAsString: NSString = NSString(data: self.data, encoding: NSUTF8StringEncoding)
        
        // Convert the retrieved data in to an object through JSON deserialization
        var err: NSError;
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
        
        if jsonResult.count>0 && jsonResult["results"].count>0 {
            var results: NSArray = jsonResult["results"] as NSArray;
            // self.tableData = results
            // self.appsTableView.reloadData()
        }
    }
}