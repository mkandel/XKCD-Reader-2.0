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

@synthesize id       = _id;
@synthesize myname   = _myname;
@synthesize comicUrl = _comicUrl;
@synthesize imageUrl = _imageUrl;

// Lazy load these properties
- (NSNumber *) id{
    if ( _id == nil ) _id = [[NSNumber alloc]init];
    return _id;
}
- (NSString *) myname{
    if ( _myname == nil ) _myname = [[NSString alloc]init];
    return _myname;
}
- (NSURL *) comicUrl{
    if ( _comicUrl == nil ) _comicUrl = [[NSURL alloc] init];
    return _comicUrl;
}
- (NSURL *) imageUrl{
    if ( _imageUrl == nil ) _imageUrl = [[NSURL alloc] init];
    return _imageUrl;
}

// Build a new entry and return it
+ (XKCDEntry *) newWithId:(NSNumber *)id
                     Name:(NSString *)name
                 comicUrl:(NSURL *)comicUrl
                 imageUrl:(NSURL *)imageUrl
{
    XKCDEntry *ret = [[XKCDEntry alloc] init];
    //ret = [super init];
    ret.id       = id;
    ret.myname   = name;
    ret.comicUrl = comicUrl;
    ret.imageUrl = imageUrl;
    return ret;
}

@end