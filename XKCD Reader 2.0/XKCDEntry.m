//
//  XKCDEntry.m
//  XKCD Reader 2.0
//
//  Created by marc on 8/6/12.
//  Copyright (c) 2012 marc. All rights reserved.
//

#import "XKCDEntry.h"

//Private implementation stuff
@interface XKCDEntry()

@end

@implementation XKCDEntry

@synthesize id   = _id;
@synthesize myname = _myname;
@synthesize url  = _url;

// Lazy load these properties
- (NSNumber *) id{
    if ( _id == nil ) _id = [[NSNumber alloc]init];
    return _id;
}
- (NSString *) myname{
    if ( _myname == nil ) _myname = [[NSString alloc]init];
    return _myname;
}
- (NSURL *) url{
    if ( _url == nil ) _url = [[NSURL alloc] init];
    return _url;
}

// Build a new entry and return it
+ (XKCDEntry *) newWithId:(NSNumber *)id Name:(NSString *)name Url:(NSURL *)url{
    XKCDEntry *ret = [[XKCDEntry alloc] init];
    //ret = [super init];
    ret.id   = id;
    ret.myname = name;
    ret.url  = url;
    return ret;
}

@end