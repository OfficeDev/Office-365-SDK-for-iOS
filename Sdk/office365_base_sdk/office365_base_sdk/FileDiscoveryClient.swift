//
//  FileDiscoveryClient.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/13/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class FileDiscoveryClient: BaseClient{
    
    func getDiscoveryInfo(callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask {
     
        var connection = HttpConnection(credentials: self.Credential, url: "https://api.office.com/discovery/me/services");
        
        return connection.execute(Constants.Method_Get, callback : callback);
    }
      
    override func parseData(data : NSData) -> NSMutableArray{
        var array = NSMutableArray();
        var err: NSError;
        
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
        
        var jsonArray : NSArray = (jsonResult.valueForKey("d") as NSDictionary).valueForKey("results") as NSArray;
        
        for value : AnyObject in jsonArray{
            var dinformation = DiscoveryInformation();
            
            dinformation.createFromJson(value as NSDictionary)

            array.addObject(dinformation);
        }
        
        return array;
    }
}