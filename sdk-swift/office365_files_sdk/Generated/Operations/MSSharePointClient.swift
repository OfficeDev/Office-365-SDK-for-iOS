/*******************************************************************************
* Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* Licensed under the Apache License, Version 2.0.
* See License.txt in the project root for license information.
******************************************************************************/

import Foundation
import office365_odata_base

public class MSSharePointClient : MSSharePointBaseODataContainer{

    public func getFiles() -> MSSharePointODataCollectionFetcher<
    MSSharePointItem,
    MSSharePointItemOperations,
        MSSharePointItemFetcher<MSSharePointItem,MSSharePointItemOperations>
        >
{
        return MSSharePointODataCollectionFetcher(urlComponent: "files", parent: self);
            //as MSSharePointODataCollectionFetcher<MSSharePointItem,MSSharePointItemOperations, MSSharePointItemFetcher<MSSharePointItem,MSSharePointItemOperations>>;
    }
}