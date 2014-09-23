
//
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "Message.h"
#import "Actions.h"

@implementation Message

-(id)init{
	
self.Operations = (id)[[ActionMessage alloc] init];	
return self;
}

-(id<Message>)getOperations{
	((ActionMessage*)(self.Operations)).EntityId = self.Id;
	return self.Operations;
}
@end
