/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

public class MSSharePointODataExecutable{
    
    var customParameters = NSMutableDictionary();
    var UrlComponent : String;
    var Parent : MSSharePointODataExecutable?;
    
    init(urlComponent : String, parent : MSSharePointODataExecutable?){
        self.UrlComponent = urlComponent;
        self.Parent = parent;
    }
    
    func getCustomParameters() -> NSDictionary{
        return self.customParameters;
    }
    
    func addCustomParameters(name : String, value : String){
    
        var dicc = NSDictionary(objectsAndKeys: value, name);
        self.customParameters.addEntriesFromDictionary(dicc);
    }
    
    func getResolver() -> MSDependencyResolver{
        return self.Parent!.getResolver();
    }
    
    func oDataExecute (path : MSODataURL, content : NSData?, verb : MSHttpVerb, callback : ((MSResponse, NSError?) -> Void!)) -> NSURLSessionDataTask{
        
        return self.Parent!.oDataExecute(path,content : content, verb : verb, callback : callback);
    }
    
    func getResult<T : NSObject>(result : MSResponse?, error : NSError?) -> T?{
        
        var r : T?;
        
        if(error == nil){
            r = self.getResolver().getJsonSerializer().deserialize(result!.getData()!) as T?;
        }
        
        return r;
    }
}