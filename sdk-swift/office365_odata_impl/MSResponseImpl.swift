/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSResponseImpl : MSResponse{

    private var data : NSData?;
    private var status : Int;
    
    required public init(data: NSData?, status: Int){
        
        self.data = data;
        self.status = status;
    }
    
    public func getStatus() -> Int {
        return self.status;
    }
    
    public func getData() -> NSData! {
        return self.data;
    }
}