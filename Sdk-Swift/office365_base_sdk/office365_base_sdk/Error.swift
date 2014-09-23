//
//  Error.swift
//  office365_base_sdk
//
//  Created by Gustavo on 6/26/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

import Foundation

class Error{

    var Code = "";
    var Exception = "";
    var Description = "";
    var jsonResult : NSDictionary = NSDictionary();
    
    func setError(data :NSData){
     
        self.jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
        
         var jsonArray = jsonResult.valueForKey("error") as NSDictionary;//).valueForKey("message") as NSArray;
        
        self.Exception = jsonArray.valueForKey("code") as String;//[0].valueAtIndex(<#index: UInt#>)
        
        self.Description = (jsonArray.valueForKey("message") as NSDictionary).valueForKey("value") as String;
       /* for value  in jsonArray{
            
            //self.Code = value.valueForKey("message") as String;
            
            for message : AnyObject in value.valueForKey("message") as NSArray{
            
                self.Description = message.valueForKey("value") as String;
            }
        }*/
    }
}
