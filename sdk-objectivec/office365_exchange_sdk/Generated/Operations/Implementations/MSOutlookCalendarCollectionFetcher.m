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

#import "MSOutlookCalendarCollectionFetcher.h"

/**
* The implementation file for type MSOutlookCalendarCollectionFetcher.
*/

@implementation MSOutlookCalendarCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookCalendar class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookCalendar* )entity :(void (^)(MSOutlookCalendar *calendar, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookCalendarFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookCalendarFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookCalendar class]];
}
@end
