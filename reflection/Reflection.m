//
//  Reflection.m
//  reflection
//
//  Created by iOS Dev on 16/2/25.
//  Copyright © 2016年 iOS Dev. All rights reserved.
//

#import "Reflection.h"
#include <objc/objc-runtime.h>
#import "SRcon.h"

@implementation Reflection

+(id)createByName:(NSString *)name WithDic:(NSDictionary *)dic
{
    Class tempClass = NSClassFromString(name);
    
    SRcon * con = [[tempClass alloc] initWithDic:dic];
    [con excute];
    return con;
}
@end
