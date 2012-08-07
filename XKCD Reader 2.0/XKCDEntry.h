//
//  XKCDEntry.h
//  XKCD Reader 2.0
//
//  Created by marc on 8/6/12.
//  Copyright (c) 2012 marc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XKCDEntry : NSObject

@property (nonatomic) NSNumber *id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSURL *url;

@end