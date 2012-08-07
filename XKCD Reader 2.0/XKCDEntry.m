//
//  XKCDEntry.m
//  XKCD Reader 2.0
//
//  Created by marc on 8/6/12.
//  Copyright (c) 2012 marc. All rights reserved.
//

#import "XKCDEntry.h"

@interface XKCDEntry()
@end

@implementation XKCDEntry

@synthesize id   = _id;
@synthesize name = _name;
@synthesize url  = _url;

// Lazy load these properties
- (NSNumber *) id{
    if ( _id == nil ) _id = [[NSNumber alloc]init];
    return _id;
}

- (NSString *) name{
    if ( _name == nil ) _name = [[NSString alloc]init];
    return _name;
}

- (NSURL *) url{
    if ( _url == nil ) _url = [[NSURL alloc] init];
    return _url;
}

@end
