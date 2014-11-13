	/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

public class MSSharePointODataCollectionFetcher<T : NSObject,
                                                U : MSSharePointODataOperations,
                                                V : MSSharePointODataEntityFetcher<NSObject,MSSharePointODataOperations>>
    //V : MSSharePointODataEntityFetcher<T1 :NSObject, U1 : MSSharePointODataOperations>>
                                                : MSSharePointODataExecutable{

    var operations : U;
    private var selectedId : String?;
    private var select : String?;
    private var filter : String?;
    private var expand : String?;
    private var top : Int?;
    private var skip : Int?;
    
    public init(urlComponent: String, parent: MSSharePointODataExecutable) {
        
        self.operations = U(urlComponent: urlComponent, parent: parent);
        super.init(urlComponent: urlComponent, parent: parent);
        self.reset();
    }
    
    public func read(callback : ((entities: Array<T>?, error: NSError?) -> Void!)) -> NSURLSessionDataTask {
        
        var task = self.oDataExecute(self.getResolver().createODataURL(), content: nil, verb: MSHttpVerb.GET, callback : { (r : MSResponse, e : NSError?) -> Void! in
            
            callback(entities: self.getListResult(r, error : e) as Array<T>?,error: e);
        });
        
        return task;
    }
    
    public func getById(id : String) -> V{
        
        self.selectedId = id;
        
        var fetcher = V(urlComponent : String(format: "('%@')" ,id) , parent : self);
        
        return fetcher;
    }
    
    public func add(entity : T,callback : ((result: T?, error: NSError?) -> Void!)) -> NSURLSessionDataTask {
        
        var payload = self.getResolver().getJsonSerializer().serialize(entity);
        
        var task = self.oDataExecute(getResolver().createODataURL(), content: payload.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false), verb: MSHttpVerb.POST, callback : { (r : MSResponse, e : NSError?) -> Void! in
            
            callback(result: self.getResult(r, error : e),error: e?);
        });
        
        return task;
    }
    
    public func getOperations() -> U{
        return self.operations;
    }
    
    public func select(params : String) -> MSSharePointODataCollectionFetcher<T,U,V>{
        
        self.select = params;
        return self;
    }
    
    public func filter(params : String) -> MSSharePointODataCollectionFetcher<T,U,V>{
        
        self.filter = params;
        return self;
    }

    public func expand(params : String) -> MSSharePointODataCollectionFetcher<T,U,V>{
        
        self.expand = params;
        return self;
    }
    
    public func top(top : Int) -> MSSharePointODataCollectionFetcher<T,U,V>{
        
        self.top = top;
        return self;
    }
    
    public func skip(skip : Int) -> MSSharePointODataCollectionFetcher<T,U,V>{
        
        self.skip = skip;
        return self;
    }
    
    override func oDataExecute (path : MSODataURL, content : NSData?, verb : MSHttpVerb, callback : ((MSResponse, NSError?) -> Void!)) -> NSURLSessionDataTask{
        
        path.appendPathComponent(self.UrlComponent);
        MSSharePointEntityFetcherHelper.setPathForCollections(path, urlComponent: self.UrlComponent, top: self.top, skip: self.skip, select: self.select, expand: self.expand, filter: self.expand);
        
        return self.Parent!.oDataExecute(path, content: content, verb: verb, callback: callback);
    }
    
    func getListResult(result : MSResponse, error : NSError?) -> Array<T>?{
        
        if(error == nil){
            return self.getResolver().getJsonSerializer().deserializeList(result.getData()) as Array<T>?;
        }
        
        return nil;
    }
    
    private func reset(){
        
        self.top = -1;
        self.skip = -1;
        self.selectedId = nil;
        self.select = nil;
        self.expand = nil;
        self.filter = nil;
    }
}