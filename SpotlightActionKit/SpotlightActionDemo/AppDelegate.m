//
//  AppDelegate.m
//  SpotlightActionDemo
//
//  Created by Jovi on 11/21/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "AppDelegate.h"
#import <SpotlightActionKit/SpotlightActionKit.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate{
    SASpotlightActionMaker          *_actionMaker;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSString *loaderPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/SpotlightActionLoader.app"];
    SASpotligjtActionConfigure *configure = [[SASpotligjtActionConfigure alloc] init];
    [configure setName:@"test"];
    [configure setIcon:[NSImage imageNamed:@"cat"]];
    [configure setPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/scpt"]];
    _actionMaker = [[SASpotlightActionMaker alloc] initWithActionLoaderPath:loaderPath];
    [_actionMaker makeActionWithConfigure:configure outPutPath:@"/Users/jovi/Desktop/"];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
