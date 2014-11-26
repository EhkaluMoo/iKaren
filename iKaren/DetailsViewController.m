//
//  DetailsViewController.m
//  iKaren
//
//  Created by Ehkalu Moo on 11/25/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

@synthesize nameLabel;
@synthesize detailsLabel;
@synthesize Detail;
@synthesize karens;
@synthesize navbar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setDetailsLabel:nil];
    [self setDetail:nil];
    [self navbar];
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated
{
    nameLabel.text = karens.name;
    detailsLabel.text = karens.description;
    Detail.text = karens.detail;
    navbar.Title = karens.navbar;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
