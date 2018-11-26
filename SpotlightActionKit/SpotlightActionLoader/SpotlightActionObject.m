//
//  SpotlightActionObject.m
//  SpotlightActionLoader
//
//  Created by Jovi on 11/22/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "SpotlightActionObject.h"
#import <ShadowstarKit/ShadowstarKit.h>

@implementation SpotlightActionObject{
    NSString            *_scriptPath;
}

-(instancetype)initWithScriptPath:(NSString *)path{
    if (self = [super init]) {
        _scriptPath = path;
    }
    return self;
}

-(void)invoke{
    if (nil == _scriptPath) {
        return;
    }
    if ([[_scriptPath pathExtension] isEqualToString:@"scpt"]) {
        //AppleScript
        [SSUtility accessFilePath:[NSURL fileURLWithPath:@"/"] persistPermission:YES withParentWindow:nil withActionBlock:^{
            [SSUtility execAppleScriptWithPathSync: self->_scriptPath error:nil];
        }];
    }else if ([[_scriptPath pathExtension] isEqualToString:@"sh"]) {
        //shell
        [SSUtility accessFilePath:[NSURL fileURLWithPath:@"/"] persistPermission:YES withParentWindow:nil withActionBlock:^{
            [SSUtility execBashCommandInCompatibleMode: [NSString stringWithFormat:@"'%@'",self->_scriptPath] withFlag: false];
        }];
    }else{
        [[NSWorkspace sharedWorkspace] openFile:_scriptPath];
    }
}

@end
