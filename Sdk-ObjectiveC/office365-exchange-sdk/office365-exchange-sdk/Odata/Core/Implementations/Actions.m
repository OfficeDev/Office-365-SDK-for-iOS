//
//  Action.m
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import "Action.h"
#import "JsonParser.h"


@implementation ActionFolder
				
-(NSURLSessionDataTask*) Copy : (NSString *) DestinationId : (void (^)(Folder *folder, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Folders('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		Folder* result = [parser parseWithData:data forType:Folder.class selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) Move : (NSString *) DestinationId : (void (^)(Folder *folder, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Folders('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		Folder* result = [parser parseWithData:data forType:Folder.class selector:selectors];
		callback(result,response,error);
	}];
}

@end

@implementation ActionMessage
				
-(NSURLSessionDataTask*) Copy : (NSString *) DestinationId : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Messages('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		Message* result = [parser parseWithData:data forType:Message.class selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) Move : (NSString *) DestinationId : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Messages('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		Message* result = [parser parseWithData:data forType:Message.class selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) CreateReply : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Messages('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		Message* result = [parser parseWithData:data forType:Message.class selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) CreateReplyAll : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Messages('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		Message* result = [parser parseWithData:data forType:Message.class selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) CreateForward : (void (^)(Message *message, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Messages('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		Message* result = [parser parseWithData:data forType:Message.class selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) Reply : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Messages('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		int result = [parser parseWithData:data forType:int selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) ReplyAll : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Messages('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		int result = [parser parseWithData:data forType:int selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) Forward : (NSString *) Comment : (NSMutableArray<Recipient> *) ToRecipients : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Messages('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		int result = [parser parseWithData:data forType:int selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) Send : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Messages('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		int result = [parser parseWithData:data forType:int selector:selectors];
		callback(result,response,error);
	}];
}

@end

@implementation ActionEvent
				
-(NSURLSessionDataTask*) Accept : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Events('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		int result = [parser parseWithData:data forType:int selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) Decline : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Events('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		int result = [parser parseWithData:data forType:int selector:selectors];
		callback(result,response,error);
	}];
}
				
-(NSURLSessionDataTask*) TentativelyAccept : (NSString *) Comment : (void (^)(int returnValue, NSURLResponse *response, NSError *error))callback
{
	EntityContainer *container = [EntityContainer getEntityContainer];

	NSString *url = [NSString stringWithFormat:@"/Events('%@')/action.Name", self.EntityId];

	//TODO: Refactor to convert all params in JsonString
	NSData *d = [DestinationId dataUsingEncoding:NSUTF8StringEncoding];

	return [container executeForPath:url Method:@"POST" Body:d Callback:^(NSData *data, NSURLResponse *response, NSError *error) {
		JsonParser *parser = [[JsonParser alloc] init];
		NSArray* selectors = [[NSArray alloc] initWithObjects:@"value", nil];

		int result = [parser parseWithData:data forType:int selector:selectors];
		callback(result,response,error);
	}];
}

@end
