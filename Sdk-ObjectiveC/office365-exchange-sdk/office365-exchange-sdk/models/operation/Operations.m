//
//  Operations.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import Operations.h;

@implementation Operations
-(Folder*)Copy :(NSString*) destinationid{
	return nil;
}

-(Folder*)Move :(NSString*) destinationid{
	return nil;
}

-(Message*)Copy :(NSString*) destinationid{
	return nil;
}

-(Message*)Move :(NSString*) destinationid{
	return nil;
}

-(Message*)CreateReply{
	return nil;
}

-(Message*)CreateReplyAll{
	return nil;
}

-(Message*)CreateForward{
	return nil;
}

-(int)Reply :(NSString*) comment{
	return nil;
}

-(int)ReplyAll :(NSString*) comment{
	return nil;
}

-(int)Forward :(NSString*) comment :(NSMutableArray<Recipient>*) torecipients{
	return nil;
}

-(int)Send{
	return nil;
}

-(int)Accept :(NSString*) comment{
	return nil;
}

-(int)Decline :(NSString*) comment{
	return nil;
}

-(int)TentativelyAccept :(NSString*) comment{
	return nil;
}

@end

