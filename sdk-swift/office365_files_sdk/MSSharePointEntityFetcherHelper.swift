/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

public class MSSharePointEntityFetcherHelper{

    public class func setPathForCollections(url : MSODataURL, urlComponent : String, top : Int?, skip : Int?, select : String?, expand : String?, filter : String?){
        
        if(top > -1){
            url.addQueryStringParameter("$top", value: NSMutableString(format: "%d",top!));
        }
        
        if(skip > -1){
            url.addQueryStringParameter("$skip", value: NSMutableString(format: "%d",skip!));
        }
        
        if(select != nil){
            url.addQueryStringParameter("$select", value : select!);
        }
        
        if(expand != nil){
            url.addQueryStringParameter("$expand", value: expand!);
        }
        
        if(filter != nil){
            url.addQueryStringParameter("$filter", value: filter!);
        }
    }
}