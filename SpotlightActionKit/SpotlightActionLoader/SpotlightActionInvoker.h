//
//  SpotlightActionInvoker.h
//  SpotlightActionLoader
//
//  Created by Jovi on 11/22/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpotlightActionInvoker : NSObject

-(instancetype)initWithActionsFolderPath:(NSString *)folderPath;
-(void)invokeAcitons;

@end

NS_ASSUME_NONNULL_END
