//
//  StepManager.h
//  reflection
//
//  Created by iOS Dev on 16/2/29.
//  Copyright © 2016年 iOS Dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StepManager : NSObject

+ (StepManager *)sharedStepManager;
- (NSString *)addStep:(NSString *)nextStep;

@end
