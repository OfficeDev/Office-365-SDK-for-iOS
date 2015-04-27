# Office 365 SDKs for iOS (Preview)

Easily integrate services and data from Office 365 into native iOS apps using these Objective-C libraries.

[![Build Status](https://travis-ci.org/OfficeDev/Office-365-SDK-for-iOS.svg?branch=master)](https://travis-ci.org/OfficeDev/Office-365-SDK-for-iOS)
[![Cocoapods Version](https://cocoapod-badges.herokuapp.com/v/Office365/badge.png)](http://cocoapods.org/?q=Office365)

---

:exclamation:**NOTE**: This code and associated binaries are released as a developer *PREVIEW*. You are free to use this library according to the terms of its included [LICENSE](/LICENSE) and to open issues in this repo for unofficial support.

Information about official Microsoft support is available  [here][support-placeholder].

[support-placeholder]: https://support.microsoft.com/

---

 These libraries are generated from API metadata using [Vipr] and [Vipr-T4TemplateWriter] and use a [shared client stack][office365_odata_base].

 Current services, service versions, and SDK versions:


|API|Service Version|Latest SDK Version|Pod Name|Umbrella Header|
|---|---------------|------------------|--------|---------------|
|Mail/Calendar/Contacts|1.0|0.9.0|Office365/Outlook|office365_exchange_sdk.h|
|Files|1.0|0.9.0|Office365/Files|office365_files_sdk.h|
|Discovery|1.0|0.9.0|Office365/Discovery|office365_discovery_sdk.h|
|AAD Graph|1.5|0.9.0|Office365/AADGraph|office365_directory_sdk.h|
|OneNote|1.0|0.9.0|Office365/OneNote|office365_onenote_sdk.h|
|Unified API|beta|0.1.0|Office365/Graph|office365_graph_sdk.h|
|SharePoint Lists|1.0|0.9.0|Office365/Lists|office365-lists-sdk.h|

[Vipr]: https://github.com/microsoft/vipr
[Vipr-T4TemplateWriter]: https://github.com/msopentech/vipr-t4templatewriter
[orc-for-ios]: https://github.com/msopentech/orc-for-ios
[office365_odata_base]: /sdk-objectivec/office365_odata_base

## Quick Start

To use these libraries in your project, follow these general steps, as described further below:

1. Configure a [Podfile].
2. Set up authentication.
3. Construct an API client.
4. Call methods to make REST calls and receive results.

[Podfile]: https://guides.cocoapods.org/syntax/podfile.html

### Setup

1. Create a new Xcode application project from the Xcode splash screen. In the dialog, choose iOS > Single View Application. Name your application as you wish; we'll assume the name *O365QuickStart* here.

2. Add a file to the project. Choose iOS > Other > Empty from the dialog and name your file `Podfile`.

3. Add these lines to the Podfile to import *all* libraries listed above.

 ```ruby
 source 'https://github.com/CocoaPods/Specs.git'
 xcodeproj 'O365QuickStart'
 pod 'Office365', '=0.9.0'
 pod 'ADALiOS', '=1.2.2'
 ```

 > NOTE: For detailed information on Cocoapods and best practices for Podfiles, read the [Using Cocoapods] guide.

4. Close the Xcode project.

5. From the command line, change to your project's directory. Then run `pod install`.

 > NOTE: Install Cocoapods first of course. Instructions [here](https://guides.cocoapods.org/using/getting-started.html).

6. From the same location in the terminal, execute `open O365QuickStart.xcworkspace` to open a workspace containing your original project together with imported pods in Xcode.

---

### Authenticate and construct client
With your project prepared, the next step is to initialize the dependency manager and an API client.

:exclamation: If you haven't yet registered your app in Azure AD, you'll need to do so before completing this step by following [these instructions][MSDN Add Common Consent].

1. Right-click the O365QuickStart folder and choose "New File." In the dialog, select *iOS* > *Resource* > *Property List*. Name the file `adal_settings.plist`. Add the following keys to the list and set their values to those from your app registration. **These are just examples; be sure to use your own values.**

 |Key|Value|
 |---|-----|
 |ClientId|Example: e59f95f8-7957-4c2e-8922-c1f27e1f14e0|
 |RedirectUri|Example: https://my.client.app/|
 |ResourceId|Example: https://graph.microsoft.com/|
 |AuthorityUrl|https://login.microsoftonline.com/common/|

2. Right-click the O365QuickStart folder and choose "New File." Select *iOS* > *Source* > *Cocoa Touch Class* and use the following names:

 - Class: MessagesViewController
 - Subclass of: UITableViewController

3. Go to Main.storyboard in your app. Add a Table View Controller from the Object list (bottom right), drag the *Entry Point* to the new controller, and delete the existing View Controller. Optionally, delete ViewController.h and ViewController.m from your project as we won't use them.

4. With the new Table View Controller selected, open the Identity inspector (top right). Under the Custom Class section, select MessagesViewController for Class. The MessageViewController is now associated with the storyboard scene.

5. From the document outline on the left, select *Messages View Controller* > *Table View* > *Table View Cell*. In the Attribute inspector (top right), set Style to *Subtitle* and Identifier to *MessageCell*.

 > NOTE: In recent versions of iOS, views extend over the entire screen, including underneath the status bar. One way to handle this is to embed your views in Navigation Controllers. To do this, select the Messages View Controller and choose Editor > Embed In > Navigation Controller.

6. Open MessagesViewController.m from the O365QuickStart folder. Add the umbrella header for an API or APIs to the top of the file:

 ```objective-c
 #import <office365_exchange_sdk/office365_exchange_sdk.h>
 ```

7. Add properties for the ADALDependencyResolver and MSOutlookServicesClient in the class extension section of MessagesViewController.m.

 ```objective-c
 @interface MessagesViewController ()
 
 @property (strong, nonatomic) ADALDependencyResolver *resolver;
 @property (strong, nonatomic) MSOutlookServicesClient *outlookClient;
 
 @end
 ```

8. Initialize the resolver and client within the viewDidLoad method of the MessagesViewController.m file.

 ```objective-c
 - (void)viewDidLoad {
     [super viewDidLoad];
 
     self.resolver = [[ADALDependencyResolver alloc] initWithPlist];
 
     self.outlookClient = [[MSOutlookServicesClient alloc] initWithUrl:@"https://outlook.office365.com/api/v1.0" dependencyResolver:self.resolver];
 }
 ```

9. Before using the client, you must ensure the user has been logged on interactively at least once. You can use either `interactiveLogon` or `interactiveLogonWithCallback:` to initiate the logon sequence. In this exercise, add the following to the viewDidLoad method from the last step:

 ```objective-c
 [self.resolver interactiveLogonWithCallback:^(ADAuthenticationResult *result) {
     if (result.status == AD_SUCCEEDED) {
         [self refreshMessages];
     } else {
         [self.resolver.logger logMessage:@"Authentication failed." withLevel:LOG_LEVEL_ERROR];
     }
 }];
 ```

10. Now you can safely use the API client. First, add another property to the class to hold messages:

 ```objective-c
 @interface MessagesViewController ()
 
 @property (strong, nonatomic) ADALDependencyResolver *resolver;
 @property (strong, nonatomic) MSOutlookServicesClient *outlookClient;
 @property (strong, nonatomic) NSArray<MSOutlookServicesMessage> *messages;
 
 @end
 ```

11. Then, add this method to the MessagesViewController.m file to refresh the stored messages:

 ```objective-c
   - (void)refreshMessages {
 
       [[[[[self.outlookClient getMe] getMessages ] top:20] readWithCallback:^(NSArray<MSOutlookServicesMessage> *messages, MSODataException *exception) {
           if (exception) {
               [self.resolver.logger logMessage:@"Message retrieval failed." withLevel:LOG_LEVEL_ERROR];
           } else {
               self.messages = messages;
               [(UITableView *)self.view reloadData];
           }
           [self.refreshControl endRefreshing];
       }] resume];
 
   }
 ```

12. Finally, hook up the cached collection of messages as the data source for MessagesViewController by modifying the Table View Data Source section of the file as follows:

 ```objective-c
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     return 1;
 }
 
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.messages.count;
 }
 
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
 
     MSOutlookServicesMessage *message = self.messages[indexPath.row];
 
     cell.textLabel.text = message.subject;
     cell.detailTextLabel.text = [NSString stringWithFormat:@"From: %@", message.from.emailAddress.address];
 
     return cell;
 }
 ```

[Using Cocoapods]: https://guides.cocoapods.org/using/using-cocoapods.html
[MSDN Add Common Consent]: https://msdn.microsoft.com/en-us/office/office365/howto/add-common-consent-manually

## Samples
- [O365-iOS-Connect] - Getting started and authentication <br />
- [O365-iOS-Snippets] - API requests and responses

[O365-iOS-Connect]: https://github.com/OfficeDev/O365-iOS-Connect
[O365-iOS-Snippets]: https://github.com/OfficeDev/O365-iOS-Snippets

## Contributing
You will need to sign a [Contributor License Agreement](https://cla.msopentech.com/) before submitting your pull request. To complete the Contributor License Agreement (CLA), you will need to submit a request via the form and then electronically sign the Contributor License Agreement when you receive the email containing the link to the document. This needs to only be done once for any Microsoft Open Technologies OSS project.

## License
Copyright (c) Microsoft Open Technologies, Inc. All rights reserved. Licensed under the Apache License, Version 2.0.
