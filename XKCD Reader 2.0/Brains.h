//
//  Brains.h
//  XKCD Reader 2.0
//
//  Created by marc on 8/6/12.
//  Copyright (c) 2012 marc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pcre.h"
#import "libxml/HTMLParser.h"

//@implementation Brains
//
//NSUrl *url;
//
//@end

@interface Brains : NSObject

- (NSArray *)getComics;
- (NSURL *)getImageURL:(NSURL *)comic_url;

@end
