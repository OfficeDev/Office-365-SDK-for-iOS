/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ItemAttachmentFetcher.h"

@implementation ItemAttachmentFetcher

-(ItemAttachmentOperations*) getOperations{
    return (ItemAttachmentOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[ItemAttachment class] :[ItemAttachmentOperations class]];
}
-(ItemFetcher) getItem{

    return [[ItemFetcher alloc] initWith:@"Item" :self :[Item class] : [ItemrOperations class]];
}
@end