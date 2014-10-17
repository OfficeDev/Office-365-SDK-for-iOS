#Office 365 IOS SDK

*Readme in progress - After samples section is not up to date*

**Table of Contents**

- [Overview](#overview)
- [Build instructions](#build-instructions)
- [Starting your app from scratch](#starting-your-app-from-scratch)
- [Office 365 Samples](#office-365-samples)
- [Simple Office 365 Sample](#simple-office-365-sample)
- [Tests](#tests)
- [Contributing](#contributing)
- [License](#license)

## Overview ##

With the Office 365 SDK for IOS Preview, it’s now possible to use data stored in Microsoft Office 365 from your IOS Apps. 

[Microsoft Open Technologies, Inc. (MS Open Tech)](http://msopentech.com) has built the **Office 365 SDK for IOS Preview**, an open source project that strives to help IOS developers access Office 365 data from their apps.

##Build instructions

```
git clone https://github.com/MSOpenTech/o365sdk-ios.git
```

Open the office365-sdks.xcworkspace with Xcode and build the projects. For building the Sample exchange app you have to add the Adal reference.

> Note: You have to have Xcode 6.

##Starting your app from scratch
This section will guide you through the process of creating a very simple application that retrieves messages using the Office 365 IOS SDK and Azure Active Directory for IOS SDK.

1. Create a new IOS application fro retireving messages using Xcode.

> **IMPORTANT**: Currently the sdk is not available as pod dependency in CocoaPods. In order to use it, just add the sdk proyects in your sample with add files to project option.

add -> office365_odata_impl
office365_exchange_sdk
ADALiOS

2. Add the necesary code to get the authentication token using ADAL library. To do that, follow the steps described in the ADAL documentation (How to use this library section).

```
https://github.com/AzureAD/azure-activedirectory-library-for-objc
```

3. Add the imports to thre project

> **IMORTANT**: You can create a pch file to add all the imports.

```
#import <office365_exchange_sdk/MSOEntityContainerClient.h>
#import <office365_odata_impl/MSODefaultDependencyResolver.h>
#import <office365_odata_impl/MSOOAuthCredentials.h>
#import <office365_odata_impl/MSOCredentialsImpl.h>
#import <office365_exchange_sdk/MSORecipient.h>
#import <office365_exchange_sdk/MSOEmailAddress.h>
#import <office365_exchange_sdk/MSOMessage.h>
#import <office365_exchange_sdk/MSOUserFetcher.h>
#import <office365_exchange_sdk/MSOMessageCollectionFetcher.h>
````

4. Once you get the token, you will need to create and instance of the Dependency Resolver 

> **IMPORTANT**: The project office365_odata_impl contains a custom implementation for:
-OAuthCredentials
-Http
-JsonParser

```
NSString* token = yourToken;
MSODefaultDependencyResolver* resolver = [MSODefaultDependencyResolver alloc];
MSOOAuthCredentials* credentials = [MSOOAuthCredentials alloc];
[credentials addToken:token];

MSOCredentialsImpl* credentialsImpl = [MSOCredentialsImpl alloc];

[credentialsImpl setCredentials:credentials];
[resolver setCredentialsFactory:credentialsImpl];

MSOEntityContainerClient *client =[[MSOEntityContainerClient alloc] initWitUrl:@"https://sdfpilot.outlook.com/ews/odata"       dependencyResolver:resolver];
````

4. To retrieve the messages of the root folder

```
NSURLSessionTask* task = [[[client getMe] getMessages] execute:^(NSArray<MSOMessage> *messages, NSError *error) {

if(error == nil){
dispatch_async(dispatch_get_main_queue(),
^{
//Put your logic here
});
}
}];

[task resume];
```

##Office 365 Samples

There is a simple exchange app for getting the user properties, the folders and messages added to the workspace (located in the sdk-objectivec folder).

For run the example you have to install the Adal Pod.
1- Open a terminal
2- Position in the simple-exchange-app folder
3- Execute Pod Install

## Features ##

## Tests ##

##Contributing##

You will need to sign a [Contributor License Agreement](https://cla.msopentech.com/) before submitting your pull request. To complete the Contributor License Agreement (CLA), you will need to submit a request via the form and then electronically sign the Contributor License Agreement when you receive the email containing the link to the document. This needs to only be done once for any Microsoft Open Technologies OSS project.

## License ##
Copyright (c) Microsoft Open Technologies, Inc. All rights reserved. Licensed under the Apache License, Version 2.0 (the "License");
