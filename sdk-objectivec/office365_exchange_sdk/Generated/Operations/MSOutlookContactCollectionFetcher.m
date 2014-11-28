/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOutlookContactCollectionFetcher.h"

/**
* The implementation file for type MSOutlookContactCollectionFetcher.
*/

@implementation MSOutlookContactCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSOutlookContact class]];
}

-(NSURLSessionDataTask*)addContact:(MSOutlookContact*)entity withCallback:(void (^)(MSOutlookContact *contact, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSOutlookContactFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookContactFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSOutlookContact class]];
}
@end