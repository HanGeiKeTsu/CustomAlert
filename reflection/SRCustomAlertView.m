//
//  SRCustomAlertView.m
//  WCAlertView
//
//  Created by iOS Dev on 16/1/12.
//  Copyright © 2016年 huangwenchen. All rights reserved.
//

#import "SRCustomAlertView.h"
#import "AppDelegate.h"

#define UIColorFromRGB(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

static const CGFloat alertviewWidth = 270.0;
static const CGFloat titleHeight = 80;
static const CGFloat imageviewHeight = 70;
static const CGFloat buttonHeight = 45;
@interface SRCustomAlertView()

@property (nonatomic, strong)UIView *alertBGV;
@property (strong,nonatomic)UIDynamicAnimator * animator;
@property (strong,nonatomic)UIView * alertview;
@property (strong,nonatomic)UIView * backgroundview;
@property (strong,nonatomic)NSString * title;
@property (strong,nonatomic)NSString * cancelButtonTitle;
@property (strong,nonatomic)NSString * okButtonTitle;
@property (strong,nonatomic)UIImage * image;
@end

@implementation SRCustomAlertView

#pragma mark - Gesture
-(void)click:(UITapGestureRecognizer *)sender{
    CGPoint tapLocation = [sender locationInView:self.backgroundview];
    CGRect alertFrame = self.alertBGV.frame;
    if (!CGRectContainsPoint(alertFrame, tapLocation)) {
        [self dismiss];
    }
}

#pragma mark -  private function
-(UIButton *)createButtonWithFrame:(CGRect)frame Title:(NSString *)title
{
    UIButton * button = [[UIButton alloc] initWithFrame:frame];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor]forState:UIControlStateNormal];
    //    button.titleLabel.textColor = [UIColor blueColor];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.layer.borderWidth = 0.5;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setShowsTouchWhenHighlighted:YES];
    return button;
}
-(void)clickButton:(UIButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(SRAlertView:didClickButtonAtIndex:)]) {
        [self.delegate SRAlertView:self didClickButtonAtIndex:(button.tag -1)];
        
    }
    [self dismiss];
    
}
-(void)dismiss{
    [self.animator removeAllBehaviors];
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
//        [self shakeToHidden:self.alertBGV];
        [self removeFromSuperview];
        self.alertBGV = nil;
    }];
}
-(void)setUp{
    self.backgroundview = [[UIView alloc] initWithFrame:[[UIApplication sharedApplication] keyWindow].frame];
    self.backgroundview.backgroundColor = [UIColor blackColor];
    self.backgroundview.alpha = 0.4;
    [self addSubview:self.backgroundview];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    [self.backgroundview addGestureRecognizer:tap];
    
    self.alertBGV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, alertviewWidth, 205)];
    //    self.alertBGV.layer.cornerRadius = 5;
    UIView * keywindow = [[UIApplication sharedApplication] keyWindow];
    self.alertBGV.center = CGPointMake(CGRectGetMidX(keywindow.frame), CGRectGetMidY(keywindow.frame)-35);
    self.alertBGV.backgroundColor = [UIColor clearColor];
    self.alertBGV.clipsToBounds = YES;
    [self addSubview:self.alertBGV];
    
    self.alertview = [[UIView alloc] initWithFrame:CGRectMake(0, 80, alertviewWidth, 125)];
    self.alertview.layer.cornerRadius = 5;
    self.alertview.backgroundColor = [UIColor whiteColor];
    self.alertview.clipsToBounds = YES;
    
    [self.alertBGV addSubview:self.alertview];
    
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,5, alertviewWidth - 10,titleHeight - 10)];
    titleLabel.text = self.title;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.numberOfLines = 0;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.alertview addSubview:titleLabel];
    
    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(50,20,alertviewWidth-100,imageviewHeight)];
    //    imageview.contentMode = UIViewContentModeScaleAspectFit;
    imageview.image = self.image;
    //    imageview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //    imageview.layer.borderWidth = 0.5;
    [self.alertBGV addSubview:imageview];
    
    CGRect cancelButtonFrame = CGRectMake(0, 80 ,alertviewWidth,buttonHeight);
    UIButton * cancelButton = [self createButtonWithFrame:cancelButtonFrame Title:self.cancelButtonTitle];
    cancelButton.backgroundColor = UIColorFromRGB(0x8fc31f);
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if (self.okButtonTitle.length != 0 && self.okButtonTitle !=nil) {
        cancelButtonFrame = CGRectMake(0 ,80, alertviewWidth/2,buttonHeight);
        CGRect okButtonFrame = CGRectMake(alertviewWidth / 2,80, alertviewWidth/2,buttonHeight);
        UIButton * okButton = [self createButtonWithFrame:okButtonFrame Title:self.okButtonTitle];
        okButton.tag = 2;
        okButton.backgroundColor = UIColorFromRGB(0x8fc31f);
        [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cancelButton.backgroundColor = [UIColor whiteColor];
        [cancelButton setTitleColor:UIColorFromRGB(0x8fc31f) forState:UIControlStateNormal];
        [self.alertview addSubview:okButton];
    }
    [cancelButton setFrame:cancelButtonFrame];
//    UIButton * cancelButton = [self createButtonWithFrame:cancelButtonFrame Title:self.cancelButtonTitle];
    cancelButton.tag = 1;
//    cancelButton.backgroundColor = [UIColor whiteColor];
//    [cancelButton setTitleColor:UIColorFromHexString(@"8fc31f") forState:UIControlStateNormal];
    [self.alertview addSubview:cancelButton];
}
#pragma mark -  API
- (void)show {
    
    UIView * keywindow = [[UIApplication sharedApplication] keyWindow];
    [self shakeToShow:self.alertBGV];
    [keywindow addSubview:self];
    
    //重力动画
//    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
//    UISnapBehavior * sanp = [[UISnapBehavior alloc] initWithItem:self.alertBGV snapToPoint:self.center];
//    sanp.damping = 0.7;
//    [self.animator addBehavior:sanp];

}
- (void) shakeToShow:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.2;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}
- (void) shakeToHidden:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.2;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.08, 0.08, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}
-(instancetype)initWithTitle:(NSString *) title
                CancelButton:(NSString *)cancelButton
                    OkButton:(NSString *)okButton{
    if (self = [super initWithFrame:[[UIApplication sharedApplication] keyWindow].frame]) {
        self.title = title;
        self.image = [UIImage imageNamed:@"messagebox_susu"];
        self.cancelButtonTitle = cancelButton;
        self.okButtonTitle = okButton;
        
        [self setUp];
    }
    return self;
}


@end
