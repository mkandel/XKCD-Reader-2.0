//
//  AppDelegate.m
//  XKCD Reader 2.0
//
//  Created by marc on 8/6/12.
//  Copyright (c) 2012 marc. All rights reserved.
//

#import "AppDelegate.h"
#import <AppKit/AppKit.h>
#import <Quartz/Quartz.h>
#import <stdlib.h>
#import <time.h>
#import "Brains.h"
#import "XKCDEntry.h"

#define MYDEBUG 0

// Private interface
@interface AppDelegate()

@property (nonatomic) NSArray *comics;
@property (nonatomic) Brains *brain;
@property (nonatomic) BOOL isSpinning;

@property (nonatomic) IBOutlet NSTextField *title;
@property (nonatomic) IBOutlet NSTableView *table;
@property (nonatomic) IBOutlet NSProgressIndicator *spinner;
@property (nonatomic) IBOutlet NSImageView *xkcdImage;
@property (weak) IBOutlet NSSearchField *filter;
@property (weak) IBOutlet NSImageView *logo;

- (void) toggleSpin;
- (void)selectTableRow:(int)row;

@end

@implementation AppDelegate

@synthesize table      = _table;
@synthesize title      = _title;
@synthesize comics     = _comics;
@synthesize brain      = _brain;
@synthesize spinner    = _spinner;
@synthesize isSpinning = _isSpinning;
@synthesize xkcdImage  = _xkcdImage;
@synthesize filter     = _filter;
@synthesize logo       = _logo;
@synthesize window     = _window;

- (Brains *) brain{
    if ( _brain == nil ) _brain = [[Brains alloc]init];
    return _brain;
}

NSInteger ONE = 1;

-(BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication{
    if (MYDEBUG) {
        NSLog(@"Entered applicationShouldTerminateAfterLastWindowClosed");
    }
    
    if (MYDEBUG) {
        NSLog(@"Exiting applicationShouldTerminateAfterLastWindowClosed");
    }
    
    return YES;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    if (MYDEBUG) {
        NSLog(@"Entered applicationDidFinishLaunching");
        if ([self conformsToProtocol:@protocol(NSTableViewDataSource)]) {
            NSLog(@"Is a NSTableViewDataSource");
        } else {
            NSLog(@"Is NOT a NSTableViewDataSource");
        }
    }
    
    // Insert code here to initialize your application
    [self.spinner stopAnimation:nil];
    self.isSpinning = NO;
    
    NSURL *logoUrl = [[NSURL alloc] initWithString:@"http://imgs.xkcd.com/s/9be30a7.png"];
    NSImage *logoImage = [[NSImage alloc] initWithContentsOfURL:logoUrl];
    [self.logo setImage:logoImage];

    [self toggleSpin];
    
    self.comics = [self.brain getComics];
    [self.title setTitleWithMnemonic:@"Welcome to XKCD Reader 2!"];
    [self toggleSpin];
    
    if (MYDEBUG > 1){
        for (int i = 0; i < [self.comics count]; i++) {
            XKCDEntry *entry = [self.comics objectAtIndex:i];
            //NSLog(@"Got item: '%@' - '%@' - '%@'", [self.comics[i] id],[self.comics[i] myname],[self.comics[i] url]);

            NSLog(@"Got item: '%@' - '%@' - '%@' - '%@'",[entry id],[entry myname],[entry comicUrl],[entry imageUrl]);
        }
    }
    NSURL *logo_url = [[NSURL alloc] initWithString:@"http://imgs.xkcd.com/s/9be30a7.png"];
    
    NSImage *logo_image = [[NSImage alloc] initWithContentsOfURL:logo_url];
    [self.xkcdImage setImage:logo_image];
    
    [self.table reloadData];
    
    if (MYDEBUG) {
        NSLog(@"Exiting applicationDidFinishLaunching");
    }
}

- (void) toggleSpin{
    if (self.isSpinning == NO){
        if (MYDEBUG) {
            NSLog(@"Spin On!");
        }
        [self.spinner startAnimation:nil];
        self.isSpinning = YES;
    } else {
        if (MYDEBUG) {
            NSLog(@"Spin Off");
        }
        [self.spinner stopAnimation:nil];
        self.isSpinning = NO;
    }
}

- (IBAction)quitPress:(NSButton *)sender {
    if (MYDEBUG) {
        NSLog(@"Entered quitPress");
    }
    if (MYDEBUG) {
        NSLog(@"Exiting quitPress");
    }
    exit(0);
}

- (IBAction)prevPress:(NSButton *)sender {
    if (MYDEBUG) {
        NSLog(@"Entered prevPress");
    }
    [self toggleSpin];
    
    NSInteger current = [self.table selectedRow];
    NSLog(@"Row: '%ld' selected",current);
    if (current <= 0) {
        current = self.comics.count - ONE;
    } else {
        current -= ONE;
    }
    
    [self selectTableRow:(int)current ];
    
    [self toggleSpin];
    if (MYDEBUG) {
        NSLog(@"Exiting prevPress");
    }
}

- (IBAction)nextPress:(NSButton *)sender {
    if (MYDEBUG) {
        NSLog(@"Entered nextPress");
    }
    [self toggleSpin];
    
    NSInteger current = [self.table selectedRow];
    NSLog(@"Row: '%ld' selected",current);
    if (current == self.comics.count - ONE) {
        current = 0;
    } else {
        current += ONE;
    }
    
    [self selectTableRow:(int)current ];
    
    [self toggleSpin];
    if (MYDEBUG) {
        NSLog(@"Exiting nextPress");
    }
}

- (void)selectTableRow:(int)row {
    NSIndexSet *row_to_select = [[NSIndexSet alloc] initWithIndex:row];
    [self.table selectRowIndexes:row_to_select byExtendingSelection:FALSE];
    [self.table scrollRowToVisible:row];
}

- (IBAction)randPress:(NSButton *)sender {
    if (MYDEBUG) {
        NSLog(@"Entered randPress");
    }
    
    [self toggleSpin];
    
    int randomElem = arc4random() % ( (int)[self.comics count] - 1 );
    
    XKCDEntry *entry = [self.comics objectAtIndex:randomElem];
    
    NSURL *comicUrl = [entry comicUrl];
    NSURL *imageUrl = [entry imageUrl];
    
    if ( MYDEBUG ){
        NSLog(@"Random element: '%d'",randomElem);
        NSLog(@"Comic URL: '%@'",comicUrl);
        NSLog(@"Image URL: '%@'",imageUrl);
    }
    
    NSImage *xkcdImage = [[NSImage alloc] initWithContentsOfURL:imageUrl];
    [self.xkcdImage setImage:xkcdImage];
    [self.title setTitleWithMnemonic:entry.myname];

    [self selectTableRow:randomElem];

    [self toggleSpin];
    
    if (MYDEBUG) {
        NSLog(@"Exiting randPress");
    }
}

// Dummy button so I can trigger breakpoints
- (IBAction)breakPress:(NSButton *)sender {
    if (MYDEBUG) {
        NSLog(@"Entered breakPress");
    }
    
    if (MYDEBUG) {
        NSLog(@"Exiting breakPress");
    }
    return;
}

// Datasource implementation
- (NSInteger)numberOfRowsInTableView:(NSTableView *)table {
    if (MYDEBUG) {
        NSLog(@"Entered numberOfRowsInTableView:");
    }
    return [self.comics count];
}

//- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray *)oldDescriptors {
////    NSArray *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"Name"
////                                                            ascending:YES
////                                                             selector:@selector(compare:)];
////    
////    [self.comics sortedArrayUsingDescriptors:sortDescriptor];
//    
//    [tableView reloadData];
//}

- (id)tableView:(NSTableView *)table objectValueForTableColumn:(NSTableColumn *)col row:(NSInteger)row {
//    if (MYDEBUG) {
//        NSLog(@"Entered objectValueForTableColumn:%@row:%ld",col  ,row);
//    }
    // the return value is typed as (id) because it will return a string in all cases with the exception of the
    id returnValue = nil;
    
    NSString *columnIdentifer = [col identifier];
    XKCDEntry *entry = [self.comics objectAtIndex:row];

    if (MYDEBUG) {
        //    NSLog(@"** Got item: '%@' - '%@' - '%@' **", [entry id],[entry myname],[entry url]);
    }
    
    if ([columnIdentifer isEqualToString:@"Name"]) {
        returnValue = entry.myname;
    } else {
        returnValue = entry.id;
    }
    
    return returnValue;
}

@end