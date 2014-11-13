/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation

public class MSSharePointFolderFetcher<T : MSSharePointFolder, U : MSSharePointODataOperations> : MSSharePointODataMediaEntityFetcher<T,U> {
    
    public override init(urlComponent : String, parent : MSSharePointODataExecutable){
        super.init(urlComponent: urlComponent, parent: parent);
        self.operations = U(urlComponent: urlComponent, parent: parent);
    }
}