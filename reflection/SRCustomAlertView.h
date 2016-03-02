//
//  SRCustomAlertView.h
//  WCAlertView
//
//  Created by iOS Dev on 16/1/12.
//  Copyright © 2016年 huangwenchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SRCustomAlertView;

@protocol SRALertviewDelegate<NSObject>

@optional
-(void)SRAlertView:(SRCustomAlertView *)alert didClickButtonAtIndex:(NSUInteger)index;
@end

@interface SRCustomAlertView : UIView

@property (assign,nonatomic) id<SRALertviewDelegate> delegate;

-(instancetype)initWithTitle:(NSString *) title
                CancelButton:(NSString *)cancelButton
                    OkButton:(NSString *)okButton;
- (void)show;

@end
