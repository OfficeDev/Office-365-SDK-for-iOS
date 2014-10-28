# Office 365 SDK for iOS

**Table of Contents**

- [Overview](#overview)
- [Develop an app](#develop-an-app)
- [Samples](#samples)
- [Contributing](#contributing)
- [License](#license)

## Overview
With [MS Open Tech](http://msopentech.com)'s open source project **Office 365 SDK for iOS** Preview, you can access all your users' info from Microsoft Office 365 in your iOS Apps. 

## Develop an app
Here's a quick guide to construct a simple application that retrieves messages using the Office 365 SDK and and Azure Active Directory Authentication Library (ADAL).

1. Create a new iOS application in Xcode.
2. Using [Cocoapods](https://cocoapods.org), retrieve the Office 365 SDKs and the Azure ADAL and add them to your project.
  > For more info on Cocoapods setup see our [wiki](https://github.com/OfficeDev/Office-365-SDK-for-iOS/wiki/Cocoapods-Setup) and [their site](http://cocoapods.org).

  To do this, add a Podfile file similar to the one used in this repo's samples to the folder where your project (.xcodeproj file) is stored. Add these lines into your Podfile:
  ```Ruby
  pod 'Office365', '~>0.5.0'
  pod 'ADALiOS', '~>1.0.0'
  ```
  
  Then, from the same directory, run `pod install` to configure your dependencies and add them and the existing project to a new workspace.
  Finally, run `open your-project-name.xcworkspace` to open your workspace in Xcode.

3. Add header imports in your code modules.
  To use the SDK, you'll need to import the necessary header files. These look like this:

  ```Objective-C
  #import <office365_odata_base/office365_odata_base.h>
  
  #import <office365_exchange_sdk/office365_exchange_sdk.h>
  #import <office365_drive_sdk/office365_drive_sdk.h>
  #import <office365_directory_sdk/office365_directory_sdk.h>
  ```

4. You'll also need to set up ADAL to handle authentication. See the [ADAL repo](https://github.com/AzureAD/azure-activedirectory-library-for-objc) and our samples (below) to help you get OAuth access tokens.

5. Set up the dependency resolver.
  Once you have your token, you'll use it to configure your dependency resolver. A typical implementation follows.

  > The dependency resolver provides a dependency injection mechanism for working with various HTTP clients, JSON serializers, credential types, and loggers. You'll need to add your OAuth access token to the dependency resolver so that it's used on all API requests.

  ```Objective-C
  NSString *accessToken = tokenReturnedByADAL;
  MSDefaultDependencyResolver *resolver = [[MSDefaultDependencyResolver alloc] init];
  MSOAuthCredentials *credentials = [[MSOAuthCredentials alloc] init];
  [credentials addToken:accessToken];
  
  MSCredentialsImpl* credentialsImpl = [[MSCredentialsImpl alloc] init];
  
  [credentialsImpl setCredentials:credentials];
  [resolver setCredentialsFactory:credentialsImpl];
  
  MSOutlookClient *client =[[MSOutlookClient alloc] initWitUrl:@"https://outlook.office365.com/api/v1.0"       dependencyResolver:resolver];
  ```

6. Now, use the SDK to automate API calls and get the data you need.
  Here's how to get all the messages for the current user.

  ```Objective-C
  NSURLSessionTask* task = [[[client getMe] getMessages] execute:^(NSArray<MSOutlookMessage> *messages, NSError *error) {
    if(error == nil){
      dispatch_async(dispatch_get_main_queue(),
        ^{
            // do something with 'messages' here
        });
      }
    }
  ];
  
  [task resume];
  ```

## Samples
In the samples folder you'll find runnable sample code for Outlook Services (aka Exchange), Files Services (aka Drive), and the Discovery Service, with more to come soon.

The samples utilize Cocoapods to configure both the Office365 SDKs and ADAL.

Here's how to run these samples:

1. Open Terminal.
2. Navigate to inside the project's folder.
3. Run `pod install`.
4. Run `open simple-<project-name>-app.xcworkspace` to open the workspace with project and dependencies.

> For more info on Cocoapods setup see our [wiki](https://github.com/OfficeDev/Office-365-SDK-for-iOS/wiki/Cocoapods-Setup) and [their site](http://cocoapods.org).

## Contributing
You will need to sign a [Contributor License Agreement](https://cla.msopentech.com/) before submitting your pull request. To complete the Contributor License Agreement (CLA), you will need to submit a request via the form and then electronically sign the Contributor License Agreement when you receive the email containing the link to the document. This needs to only be done once for any Microsoft Open Technologies OSS project.

## License
Copyright (c) Microsoft Open Technologies, Inc. All rights reserved. Licensed under the Apache License, Version 2.0.
