/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSSharePointItem : NSObject{
    
    public override init(){
        
        self.__ODataType = "#Microsoft.FileServices.Item";
    }

    public var __ODataType = String();
    //var MSSharePointIdentitySet *createdBy;
    public var eTag = String();
    public var id = String()
    //var MSSharePointIdentitySet *lastModifiedBy;
    public var name = NSString();
    //var MSSharePointItemReference *parentReference;
    public var size = Int();
    public var dateTimeCreated = NSDate();
    public var dateTimeLastModified = NSDate();
    public var type = String();
    public var webUrl = String();
}