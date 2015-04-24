
#import <Foundation/Foundation.h>
#import "BaseTestRunner.h"
#import "Test.h"


@interface MSGraphTestRunner : BaseTestRunner
@property NSString *TestMail;
@property MSGraphServiceClient *Client;

-(id)initWithClient : (MSGraphServiceClient*)client;

@end
