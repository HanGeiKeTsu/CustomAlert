//
//  SRVIew.m
//  reflection
//
//  Created by iOS Dev on 16/2/25.
//  Copyright © 2016年 iOS Dev. All rights reserved.
//

#import "SRVIew.h"

@implementation SRVIew
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self setFrame:CGRectMake(100, 100, 100, 200)];
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
