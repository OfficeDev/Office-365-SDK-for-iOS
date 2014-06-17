//
//  BaseClient.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/17/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class BaseClient : NSObject{

    var data: NSMutableData = NSMutableData();
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        println("Connection failed.\(error.localizedDescription)");
    }
    
    func connection(connection: NSURLConnection, didRecieveResponse response: NSURLResponse)  {
        println("Recieved response");
    }
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        self.data = NSMutableData();
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        self.data.appendData(data);
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) -> NSDictionary{
        var dataAsString: NSString = NSString(data: self.data, encoding: NSUTF8StringEncoding)
        
        // Convert the retrieved data in to an object through JSON deserialization
        var err: NSError;
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;

        return jsonResult;
    }
}