//
//  FileTableViewCell.h
//  file-app
//
//  Created by Gustavo on 6/30/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *DownloadButton;
@property (weak, nonatomic) IBOutlet UILabel *FileName;

@end