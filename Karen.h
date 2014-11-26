//
//  Karen.h
//  iKaren
//
//  Created by Ehkalu Moo on 11/25/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Karen : NSObject

@property (nonatomic, retain) NSString* name;

@property (nonatomic, retain) NSString* description;

@property (nonatomic, retain) NSString* detail;

@property (nonatomic, retain) NSString* navbar;

-(id) initWithName:(NSString*) theName andDescription:(NSString*)theDescription detail:(NSString*)detail navbar:(NSString*)Title;


@end
