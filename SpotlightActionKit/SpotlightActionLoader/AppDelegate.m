//
//  AppDelegate.m
//  SpotlightActionLoader
//
//  Created by Jovi on 11/21/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "AppDelegate.h"
#import "SpotlightActionInvoker.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate{
    SpotlightActionInvoker           *_invoker;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _invoker = [[SpotlightActionInvoker alloc] initWithActionsFolderPath:
                [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/p"]];
    [_invoker invokeAcitons];
    [NSApp terminate:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
