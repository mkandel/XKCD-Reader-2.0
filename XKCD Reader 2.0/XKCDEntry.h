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
@property (nonatomic) NSString *myname;
@property (nonatomic) NSURL *comicUrl;
@property (nonatomic) NSURL *imageUrl;

+ (XKCDEntry *) newWithId:(NSNumber *)id Name:(NSString *)name comicUrl:(NSURL *)comicUrl imageUrl:(NSURL *)imageUrl;

@end