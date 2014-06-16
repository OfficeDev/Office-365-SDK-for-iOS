//
//  HttpConnection.swift
//  office365-base-sdk
//
//  Created by Lagash on 6/13/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class HttpConnection : NSObject{
    
    var request : NSMutableURLRequest = NSMutableURLRequest();
    var data: NSMutableData = NSMutableData()
    var credentials : Credentials = Credentials();
    
    init (){
    
    }
    
    func initializeWith(url : String, credentials : Credentials){
        
        self.credentials = credentials;
        
        request = NSMutableURLRequest(URL : NSURL(string : "www.google.com"));// url));
        
        //request.HTTPBody = (data as NSString).dataUsingEncoding(NSUTF8StringEncoding);
        
       /* for(key, value) in [ "Accept" : "application/json;odata.metadata=full",
            "Expect": "100-continue",
            "Content-Type": "application/json;odata.metadata=full",
            "Accept" : "application/json;odata=verbose",
            "X-ClientService-ClientTag": "SDK-Swift"
            ] {
                request.addValue(value, forHTTPHeaderField: key);
        }*/
        request.addValue("Accept", forHTTPHeaderField: "application/json;odata.metadata=full");
        request.addValue("Expect", forHTTPHeaderField: "100-continue");
        request.addValue("Content-Type", forHTTPHeaderField: "application/json;odata.metadata=full");
       // request.addValue("Accept", forHTTPHeaderField: "application/json;odata=verbose");
      //	  request.addValue("X-ClientService-ClientTag", forHTTPHeaderField: "SDK-Swift");
      //  credentials.prepareRequest(request);
        //self.init();
    }
    
    /* func addToken(){
    request.addValue("Authorization", forHTTPHeaderField: "Bearer " + self.Token);
    }*/
    
    func execute(method : String){
        request.HTTPMethod = method;
        
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false);
        
        connection.start();
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        println("Connection failed.\(error.localizedDescription)");
    }
    
    func connection(connection: NSURLConnection, didRecieveResponse response: NSURLResponse)  {
        println("Recieved response");
    }
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        // Recieved a new request, clear out the data object
        self.data = NSMutableData();
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        // Append the recieved chunk of data to our data object
        self.data.appendData(data);
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        // Request complete, self.data should now hold the resulting info
        // Convert it to a string
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