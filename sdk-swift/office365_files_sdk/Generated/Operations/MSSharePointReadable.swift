/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

protocol MSSharePointReadable{

    func read<T : NSObject>(callback : (entity : T?, error : NSError) -> Void!) -> NSURLSessionDataTask;
}