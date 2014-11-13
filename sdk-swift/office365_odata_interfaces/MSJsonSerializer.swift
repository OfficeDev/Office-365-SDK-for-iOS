/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public protocol MSJsonSerializer{

    init();
    func serialize(objectToSerialize: AnyObject) -> String;
    func deserialize<T : NSObject>(data : NSData) -> T?;
    func deserializeList<T : NSObject>(data : NSData) -> Array<T>?;
    func serialize (objectToSerialize : AnyObject, name : String) -> String;
}