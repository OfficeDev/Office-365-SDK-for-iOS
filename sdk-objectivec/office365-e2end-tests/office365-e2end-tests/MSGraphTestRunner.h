
#import <Foundation/Foundation.h>
#import "BaseTestRunner.h"
#import "Test.h"


@interface MSGraphTestRunner : BaseTestRunner
@property NSString *TestMail;
@property MSGraphClient *Client;

-(id)initWithClient : (MSGraphClient*)client;

@end
