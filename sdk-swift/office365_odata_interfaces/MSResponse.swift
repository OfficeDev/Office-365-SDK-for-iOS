/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public protocol MSResponse{

    init(data : NSData?, status : Int)
    func getStatus() -> NSInteger
    func getData() -> NSData!
}