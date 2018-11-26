//
//  SASpotlightActionMaker.h
//  SpotlightActionKit
//
//  Created by Jovi on 11/25/18.
//  Copyright © 2018 Jovi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class SASpotligjtActionConfigure;
@interface SASpotlightActionMaker : NSObject

-(instancetype)initWithActionLoaderPath:(NSString *)path;
-(void)makeActionWithConfigure:(SASpotligjtActionConfigure *)configure outPutPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
