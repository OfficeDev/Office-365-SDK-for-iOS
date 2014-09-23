
//
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "Event.h"
#import "Actions.h"

@implementation Event

-(id)init{
	
self.Operations = (id)[[ActionEvent alloc] init];	
return self;
}

-(id<Event>)getOperations{
	((ActionEvent*)(self.Operations)).EntityId = self.Id;
	return self.Operations;
}
@end
