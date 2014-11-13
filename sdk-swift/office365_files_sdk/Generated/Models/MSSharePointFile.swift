/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSSharePointFile : MSSharePointItem{

    override init(){
        
        super.init();
        self.__ODataType = "#Microsoft.FileServices.File";
    }
    
    var contentUrl = String();
}