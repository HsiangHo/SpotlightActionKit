//
//  SASpotlightActionMaker.m
//  SpotlightActionKit
//
//  Created by Jovi on 11/25/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "SASpotlightActionMaker.h"
#import "SASpotligjtActionConfigure.h"
#import <Cocoa/Cocoa.h>

@implementation SASpotlightActionMaker{
    NSString *_loaderPath;
}

-(instancetype)initWithActionLoaderPath:(NSString *)path{
    if (self = [super init]) {
        _loaderPath = path;
    }
    return self;
}

-(void)makeActionWithConfigure:(SASpotligjtActionConfigure *)configure outPutPath:(NSString *)path{
    if (nil == [configure name] || [[configure name] isEqualToString:@""]) {
        return;
    }
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    if (![path hasSuffix:@"/"]) {
        path = [path stringByAppendingString:@"/"];
    }
    NSString *destAppPath = [NSString stringWithFormat:@"%@%@.app", path, [configure name]];
    [[NSFileManager defaultManager] copyItemAtPath:_loaderPath toPath:destAppPath error:nil];
    
    NSString *iconPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/AppIcon.icns"];
    NSString *iconDestPath = [destAppPath stringByAppendingString:@"/Contents/Resources/AppIcon.icns"];
    if(nil != [configure icon]){
        [[NSWorkspace sharedWorkspace] setIcon:[configure icon] forFile:destAppPath options:0];
    }else{
        [[NSFileManager defaultManager] copyItemAtPath:iconPath toPath:iconDestPath error:nil];
    }
    
    BOOL bFlag = NO;
    NSString *scptPath = [destAppPath stringByAppendingString:@"/Contents/Resources/p"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[configure path] isDirectory:&bFlag]) {
        if (bFlag) {
            NSString *folderPath = [configure path];
            NSArray * scptNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath: folderPath error:nil];
            if (![folderPath hasSuffix:@"/"]) {
                folderPath = [NSString stringWithFormat:@"%@/",folderPath];
            }
            for (NSString *name in scptNames) {
                [[NSFileManager defaultManager] copyItemAtPath: [NSString stringWithFormat:@"%@%@",folderPath, name] toPath:[NSString stringWithFormat:@"%@/%@",scptPath, name] error:nil];
            }
        }else{
            [[NSFileManager defaultManager] copyItemAtPath:[configure path] toPath:[NSString stringWithFormat:@"%@/%@",scptPath, [[configure path] lastPathComponent] ] error:nil];
        }
    }
}

@end
