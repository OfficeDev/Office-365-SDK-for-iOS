//
//  ViewController.h
//  GraphSDKSample
//
//  Created by Miguel Ángel Pérez Martínez on 12/2/15.
//  Copyright © 2015 Miguel Ángel Pérez Martínez. All rights reserved.
//

#import <MSGraphService.h>
#import <impl/ADALDependencyResolver.h>
#import <ADAuthenticationResult.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) ADALDependencyResolver *resolver;
@property (strong, nonatomic) MSGraphServiceClient *graphClient;

@property (atomic) int updateCount;

@end

