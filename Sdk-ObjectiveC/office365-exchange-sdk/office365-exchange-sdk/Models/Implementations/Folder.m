
//
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "Folder.h"
#import "Actions.h"

@implementation Folder

-(id)init{
	
self.Operations = (id)[[ActionFolder alloc] init];	
return self;
}

-(id<Folder>)getOperations{
	((ActionFolder*)(self.Operations)).EntityId = self.Id;
	return self.Operations;
}
@end
