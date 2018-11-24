//
//  SpotlightActionInvoker.m
//  SpotlightActionLoader
//
//  Created by Jovi on 11/22/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import "SpotlightActionInvoker.h"
#import "SpotlightActionObject.h"

@implementation SpotlightActionInvoker{
    NSMutableArray<SpotlightActionObject *>     *_arrayActionObjs;
}

-(instancetype)initWithActionsFolderPath:(NSString *)folderPath{
    if (self = [super init]) {
        _arrayActionObjs = [[NSMutableArray alloc] init];
        NSArray * scptNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
        if (![folderPath hasSuffix:@"/"]) {
            folderPath = [NSString stringWithFormat:@"%@/",folderPath];
        }
        for (NSString *name in scptNames) {
            NSString *path = [NSString stringWithFormat:@"%@%@",folderPath, name];
            SpotlightActionObject *actionObj = [[SpotlightActionObject alloc] initWithScriptPath:path];
            [_arrayActionObjs addObject:actionObj];
        }
    }
    return self;
}

-(void)invokeAcitons{
    for (SpotlightActionObject *actionObj in _arrayActionObjs) {
        [actionObj invoke];
    }
}

@end
