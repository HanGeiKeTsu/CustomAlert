//
//  StepManager.m
//  reflection
//
//  Created by iOS Dev on 16/2/29.
//  Copyright © 2016年 iOS Dev. All rights reserved.
//

#import "StepManager.h"

static StepManager *stepMana = nil;
static NSString *stepStr = @"start";

@implementation StepManager

+ (StepManager *)sharedStepManager
{
    if (stepMana == nil) {
        stepMana = [[StepManager alloc] init];
    }
    return stepMana;
}
- (NSString *)addStep:(NSString *)nextStep
{
    stepStr = [NSString stringWithFormat:@"%@-%@",stepStr,nextStep];
    NSLog(@"current stepStr : %@",stepStr);
    return stepStr;
}

@end
