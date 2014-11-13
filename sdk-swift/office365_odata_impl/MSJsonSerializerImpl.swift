/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSJsonSerializerImpl : MSJsonSerializer{
    
    required public init(){
    }
    
    var metadataValues = NSDictionary(objects: ["@odata.type"], forKeys: ["__ODataType"])
    
    public func serialize(objectToSerialize: AnyObject) -> String{
        var ref = reflect(objectToSerialize);
        var count = ref.count - 1;
        var i : Int = 0;
        var dicc = NSMutableDictionary();
        for index in 1...count{
            
            var key = ref[index].0 as String;
            var value: AnyObject? = objectToSerialize.valueForKey(key);
            
            if(value != nil){
                if(value!.isKindOfClass(NSDate)){
                    var dateFormatter : NSDateFormatter = NSDateFormatter();
                    dateFormatter.timeZone = NSTimeZone(name: "UTC");
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz";
                    var date : NSString = dateFormatter.stringFromDate(value as NSDate);
                    
                    var dateString : NSString = date.substringToIndex(19) + "Z";
                    
                    value = dateString;
                }
                
                dicc.addEntriesFromDictionary(NSMutableDictionary(object: value!, forKey: getName(key)));
            }
            //var value: AnyObject? = jsonResult.objectForKey(key);
            
            //if(value != nil){
            //result.setValue(value!, forKey: key as String);
            //}
        }
        
        // return result;
        
        var r : NSData? = NSJSONSerialization.dataWithJSONObject(dicc, options: NSJSONWritingOptions.allZeros, error: nil);
        
        //NSJSONSerialization.dataWithJSONObject(dicc, options: 0, error: nil);
        
        return NSString(data: r!, encoding: NSUTF8StringEncoding)!;
    }
    
    public func deserialize<T : NSObject>(data : NSData) -> T?{
        
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
        
        return self.deserialize(jsonResult);
    }
    
    public func deserializeList<T : NSObject>(data : NSData) -> Array<T>?{
        
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary;
        
        var jsonArray : NSArray = jsonResult.valueForKey("value") as NSArray;
        var array = Array<T>();
        
        for value in jsonArray{
            
            var newItem : T? = self.deserialize(value as NSDictionary);
            if(newItem != nil){
                array.append(newItem!);
            }
        }
        
        return array;
    }
    
    private func deserialize<T : NSObject>(jsonResult : NSDictionary) -> T?{
        
        var result = T();
        var ref = reflect(result);
        var count = ref.count - 1;
        var i : Int = 0;
        
        for index in 0...count{
            
            var key = ref[index].0 as String;
            
            var value: AnyObject? = jsonResult.objectForKey(key);
            
            if(value != nil){
                result.setValue(value!, forKey: key as String);
            }
        }
        
        return result;
    }
    
    private func getName(propertyName : NSString) -> String{
        
        for key in self.metadataValues.allKeys{
            
            if(key.isEqualToString(propertyName)){
                return self.metadataValues.objectForKey(key) as NSString;
            }
        }
        
        return propertyName;
    }
    
    public func serialize(objectToSerialize : AnyObject, name : String) -> String{
        
        var ref = reflect(objectToSerialize);
        var count = ref.count - 1;
        var i : Int = 0;
        
        for index in 0...count{
            
            var key = ref[index].0 as String;
            
            //var value: AnyObject? = jsonResult.objectForKey(key);
            
            //if(value != nil){
                //result.setValue(value!, forKey: key as String);
            //}
        }
        
       // return result;
        
        return "";
    }
}