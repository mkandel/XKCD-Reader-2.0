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

- (void) toggleSpin;

@end

@implementation AppDelegate

@synthesize table      = _table;
@synthesize title      = _title;
@synthesize comics     = _comics;
@synthesize brain      = _brain;
@synthesize spinner    = _spinner;
@synthesize isSpinning = _isSpinning;
@synthesize xkcdImage  = _xkcdImage;

- (Brains *) brain{
    if ( _brain == nil ) _brain = [[Brains alloc]init];
    return _brain;
}

-(BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication{
    if (MYDEBUG) {
        NSLog(@"Entered applicationShouldTerminateAfterLastWindowClosed");
    }
    
    return YES;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    if (MYDEBUG) {
        NSLog(@"Entered applicationDidFinishLaunching");
    }
    
    // Insert code here to initialize your application
    [self.spinner stopAnimation:nil];
    self.isSpinning = NO;

    [self toggleSpin];
    self.comics = [self.brain getComics];
    [self.title setTitleWithMnemonic:@"Welcome to XKCD Reader 2!"];
    [self toggleSpin];

    NSURL *logo_url = [[NSURL alloc] initWithString:@"http://imgs.xkcd.com/s/9be30a7.png"];
    
    NSImage *logo_image = [[NSImage alloc] initWithContentsOfURL:logo_url];
    [self.xkcdImage setImage:logo_image];
    
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
    
    if (MYDEBUG) {
        NSLog(@"Exiting prevPress");
    }
}

- (IBAction)nextPress:(NSButton *)sender {
    if (MYDEBUG) {
        NSLog(@"Entered nextPress");
    }
    
    [self toggleSpin];
    
    if (MYDEBUG) {
        NSLog(@"Exiting nextPress");
    }
}

- (IBAction)randPress:(NSButton *)sender {
    if (MYDEBUG) {
        NSLog(@"Entered randPress");
    }
    if (MYDEBUG) {
        NSLog(@"Exiting randPress");
    }
}

// Dummy button so I can trigger breakpoints
- (IBAction)breakPress:(NSButton *)sender {
    if (MYDEBUG) {
        NSLog(@"Entered randPress");
    }
    
    if (MYDEBUG) {
        NSLog(@"Exiting randPress");
    }
    return;
}

@end