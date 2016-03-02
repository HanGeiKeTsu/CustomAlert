//
//  SRUser.h
//  reflection
//
//  Created by iOS Dev on 16/2/25.
//  Copyright © 2016年 iOS Dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRUser : NSObject

@property (nonatomic, strong) NSString *name;

- (NSArray*)propertyKeys;
- (BOOL)reflectDataFromOtherObject:(NSObject*)dataSource;

@end
