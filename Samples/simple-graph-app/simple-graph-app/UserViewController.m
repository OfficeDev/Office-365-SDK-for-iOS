/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "UserViewController.h"
#import <office365_graph_sdk/office365_graph_sdk.h>
#import "AuthManager.h"
#import <ADALiOS/ADAuthenticationResult.h>
#import <ADALiOS/ADAuthenticationError.h>

@interface UserViewController ()

@property (strong, nonatomic) NSDictionary *settings;
@property (strong, nonatomic) NSArray *users;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"adal_settings" ofType:@"plist"];
    _settings = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    [[AuthManager instance].dependencyResolver interactiveLogonWithCallback:^(ADAuthenticationResult *theResult) {
        if (theResult.status != AD_SUCCEEDED) {
            [[AuthManager instance].dependencyResolver.logger logMessage:theResult.error.errorDetails withLevel:LOG_LEVEL_ERROR];
        } else {
            [self updateUsers];
        }
    }];
    
    self.pkrUsers.dataSource = self;
    self.pkrUsers.delegate = self;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)refresh:(id)sender {

}

- (void)updateUsers {
    MSGraphClient *graphClient = [[MSGraphClient alloc] initWithUrl:[self.settings valueForKey:@"GraphMyOrg"] dependencyResolver:[AuthManager instance].dependencyResolver];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [[[graphClient getusers] readWithCallback:^(NSArray<MSGraphUser> *theUsers, MSODataException *exception) {
        if (exception != nil) {
            [graphClient.resolver.logger logMessage:exception.description withLevel:LOG_LEVEL_ERROR];
        } else {
            [graphClient.resolver.logger logMessage:@"Results received..." withLevel:LOG_LEVEL_INFO];
            self.users = theUsers;
            [self.pkrUsers reloadAllComponents];
            
        }
        
        dispatch_semaphore_signal(semaphore);
    
    }] resume];
    
    dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10*10^9)); // 10^9 == nanosecond
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.users.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return ((MSGraphUser *)self.users[row]).displayName;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    MSGraphUser *selectedUser = (MSGraphUser *)self.users[row];
    self.mailNickname.text = selectedUser.mailNickname;
    self.displayName.text = selectedUser.displayName;
    self.userType.text = selectedUser.userType;
    self.uPN.text = selectedUser.userPrincipalName;
    self.objectId.text = selectedUser.objectId;

}

@end
