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
#import <WebKit/WebKit.h>
#import "XKCDEntry.h"

#define MYDEBUG 0

// Private interface
@interface Brains()

// Private variables
@property (nonatomic) NSURL *base;
@property (nonatomic,strong) NSArray *comics;

// Private methods
- (void) loadComics;
- (NSURL *)getImageURL:(NSURL *)comic_url;

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
    if ([self.comics count] < 1) {
         [self loadComics];
    }

    return self.comics;
}

- (NSURL *)getImageURL:(NSURL *)comic_url{
    NSURL *ret = [[NSURL alloc] init];
    return ret;
}

- (void) loadComics{
    if (MYDEBUG) {
        NSLog(@"Entered loadComics");
    }
    
    // Build up a mutable array of the comics
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 50 ; i++) {
        // Add a dummy entry for testing:
        NSNumber *id     = [[NSNumber alloc] initWithInt:i];
        NSString *name   = [[NSString alloc] initWithFormat:@"Comic-#%@", id];
        NSString *tmpUrl = [[NSString alloc] initWithFormat:@"%@/%@/%@.png",self.base,id,name];
        NSURL *url       = [[NSURL alloc] initWithString:tmpUrl];
        
        XKCDEntry *entry = [XKCDEntry newWithId:id Name:name comicUrl:url imageUrl:url];
        [temp addObject:entry];
    }
    
    // Set self.comics to an NSArray version of the complete list
    self.comics = temp.copy;
    if (MYDEBUG) {
        NSLog(@"Exiting loadComics");
    }
}

@end