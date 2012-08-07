//
//  Brains.h
//  XKCD Reader 2.0
//
//  Created by marc on 8/6/12.
//  Copyright (c) 2012 marc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Brains : NSObject

// TODO: testing, remove this:
@property (nonatomic) NSURL *base;

- (NSArray *)getComics;
- (NSURL *)getImageURL:(NSURL *)comic_url;

@end