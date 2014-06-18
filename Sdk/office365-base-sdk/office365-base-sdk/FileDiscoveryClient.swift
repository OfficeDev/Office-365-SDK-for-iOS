//
//  FileDiscoveryClient.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/13/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class FileDiscoveryClient: BaseClient{
    
    func getDiscoveryInfo(credentials : Credentials, callback : ((NSData!, NSURLResponse!, NSError!) -> Void)!) -> NSURLSessionDataTask {
     
        var connection = HttpConnection();
        connection.initializeWith("https://api.office.com/discovery/me/services",credentials: credentials);
        
        return connection.execute(Constants.Method_Get, client: self, callback : callback);
    }
      
    override func parseData(data : NSData) -> NSMutableArray{
        var array = NSMutableArray();
        var err: NSError;
        
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
        
        var jsonArray : NSArray = (jsonResult.valueForKey("d") as NSDictionary).valueForKey("results") as NSArray;
        
        for value : AnyObject in jsonArray{
            var dinformation = DiscoveryInformation();
            var diccionary = value as NSDictionary;
            
            dinformation.Capability = diccionary.valueForKey("Capability") as String;
            dinformation.ServiceName = diccionary.valueForKey("ServiceName") as String;
            dinformation.ServiceEndpointUri = diccionary.valueForKey("ServiceEndpointUri") as String;
            dinformation.ServiceResourceId = diccionary.valueForKey("ServiceResourceId") as String;
            //dinformation.Id = diccionary.valueForKey("id") as String;

            array.addObject(dinformation);
        }
        
        return array;
    }
}