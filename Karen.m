//
//  Karen.m
//  iKaren
//
//  Created by Ehkalu Moo on 11/25/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "Karen.h"

@implementation Karen

@synthesize name;

@synthesize description;

@synthesize detail;

@synthesize navbar;


-(id) initWithName:(NSString *)theName andDescription:(NSString *)theDescription detail:(NSString *)Detail navbar:(NSString *)Title
{
    self = [super init];
    if(self)
    {
        self.name = theName;
        self.description = theDescription;
        self.detail = Detail;
        self.navbar = Title;
    }
    return self;
}

@end
