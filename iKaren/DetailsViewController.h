//
//  DetailsViewController.h
//  iKaren
//
//  Created by Ehkalu Moo on 11/25/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Karen.h"
@interface DetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationItem *navbar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *Detail;

@property (strong, nonatomic) Karen* karens;

@end
