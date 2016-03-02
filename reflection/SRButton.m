//
//  SRButton.m
//  reflection
//
//  Created by iOS Dev on 16/2/25.
//  Copyright © 2016年 iOS Dev. All rights reserved.
//

#import "SRButton.h"

@implementation SRButton

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setFrame:CGRectMake(100, 400, 100, 100)];
        self.backgroundColor = [UIColor brownColor];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
