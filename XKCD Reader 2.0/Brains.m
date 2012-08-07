//
//  Brains.m
//  XKCD Reader 2.0
//
//  Created by marc on 8/6/12.
//  Copyright (c) 2012 marc. All rights reserved.
//

#import "Brains.h"
#import "pcre.h"
#import "libxml/HTMLParser.h"

#define MYDEBUG 0

// Private interface
@interface Brains()

// Private variables
// TODO: testing, uncomment this:
//@property (nonatomic) NSURL *base;
@property (nonatomic,strong) NSArray *comics;

// Private methods
- (void) loadComics;

@end


@implementation Brains

@synthesize base   = _base;
@synthesize comics = _comics;

- (NSURL *) base{
    if ( _base == nil ) _base = [[NSURL alloc]initWithString:@"http://xkcd.com/archive/"];
    return _base;
}

- (NSArray *) comics{
    if (_comics == nil) _comics = [[NSArray alloc] init];
    return _comics;
}

- (NSArray *)getComics{
    NSURL *tmp = self.base;
    NSLog(@"%@", tmp);
    return self.comics;
}

- (NSURL *)getImageURL:(NSURL *)comic_url{
    NSURL *ret = [[NSURL alloc] init];
    return ret;
}

- (void) loadComics{
    // Build up a mutable array of the comics
    NSMutableArray *temp;
    
    // Set self.comics to an NSArray version of the complete list
    self.comics = temp.copy;
}

@end