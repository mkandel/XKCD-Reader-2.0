//
//  AppDelegate.h
//  XKCD Reader 2.0
//
//  Created by marc on 8/6/12.
//  Copyright (c) 2012 marc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSTableViewDataSource>

@property (assign) IBOutlet NSWindow *window;
//@property (weak) IBOutlet NSTableView *table;

// Datasource Protocol implementation
- (NSInteger)numberOfRowsInTableView:(NSTableView *)table;
- (id)tableView:(NSTableView *)table objectValueForTableColumn:(NSTableColumn *)col row:(NSInteger)row;

@end