//
//  MainViewController.m
//  reflection
//
//  Created by iOS Dev on 16/3/2.
//  Copyright © 2016年 iOS Dev. All rights reserved.
//

#import "MainViewController.h"
#import "Reflection.h"
#import "SRVIew.h"
#import "SRButton.h"
#import "viewcon.h"
#import "SRCustomAlertView.h"

@interface MainViewController () <SRALertviewDelegate>

@end

@implementation MainViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    SRUser *user = [Reflection createByName:@"SRUser"];
    //    SRVIew *view = [Reflection createByName:@"SRVIew"];
    //
    ////    [user propertyKeys];
    //    [user reflectDataFromOtherObject:@{@"name":@"panyijie"}];
    //
    //
    //    NSLog(@"%@",user.name);
    //
    //    NSLog(@"%@",[Reflection createByName:@"SRChatViewController"]);
    //
    //    NSLog(@"%@",[Reflection createByName:@"SRVIew"]);
    //
    //
    
    
    //    [self.view addSubview:view];
    //
    //
    //    Class class = [SRUser class];
    //    NSString *str = NSStringFromClass(class);
    //    NSLog(@"class_name = %@",str);
    
    //    [self createFace];
    
    SRButton *button = [[SRButton alloc] init];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    SRButton *button1 = [[SRButton alloc] init];
    [button1 setFrame:CGRectMake(100, 100, 100, 100)];
    [button1 addTarget:self action:@selector(buttonAction1:) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:button1];
}
-(void)viewDidAppear:(BOOL)animated
{
    
    //    [self buttonAction:nil];
}
- (void)buttonAction:(id)sender
{
    //    [self presentViewController:[Reflection createByName:@"SRChat" WithDic:@{@"name":@"panyijie",@"age":@"18"}] animated:YES completion:nil];
    [self.navigationController pushViewController:[Reflection createByName:@"SRChat" WithDic:@{@"name":@"panyijie",@"age":@"18"}] animated:YES];
    //    [self presentViewController:[Reflection createByName:@"SRavtivi" WithDic:nil] animated:YES completion:nil];
    //    [self presentViewController:[Reflection createByName:@"viewcon" WithDic:nil] animated:YES completion:nil];
    
    SRCustomAlertView *alert = [[SRCustomAlertView alloc] initWithTitle:@"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦" CancelButton:@"取消" OkButton:@"ok"];
    alert.tag = 100;
    alert.delegate = self;
    //    [alert show];
    
}
-(void)buttonAction1:(id)sender
{
    SRCustomAlertView *alert = [[SRCustomAlertView alloc] initWithTitle:@"dododododododoododoodododoo" CancelButton:@"取消" OkButton:@"ok"];
    alert.tag = 101;
    alert.delegate = self;
    [alert show];
}
-(void)SRAlertView:(SRCustomAlertView *)alert didClickButtonAtIndex:(NSUInteger)index
{
    if (alert.tag ==100) {
        NSLog(@"100");
    } else {
        NSLog(@"101");
    }
}
- (void)createFace
{
    UIImage* image = [UIImage imageNamed:@"200847102519925_2.jpg"];
    UIImageView *testImage = [[UIImageView alloc] initWithImage: image];
    [testImage setTransform:CGAffineTransformMakeScale(0.2, -0.2)];
    [[[UIApplication sharedApplication] delegate].window setTransform:
     CGAffineTransformMakeScale(0.2, -0.2)];
    [testImage setFrame:CGRectMake(0, 0, testImage.image.size.width,
                                   testImage.image.size.height)];
    [self.view addSubview:testImage];
    
    
    [self faceCheck:image];
}
- (void)faceCheck:(UIImage *)img
{
    CIImage* image = [CIImage imageWithCGImage:img.CGImage];
    NSDictionary  *opts = [NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh
                                                      forKey:CIDetectorAccuracy];
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil
                                              options:opts];
    //得到面部数据
    NSArray* features = [detector featuresInImage:image];
    for (CIFaceFeature *faceFeature in features){
        
        CGFloat faceWidth = faceFeature.bounds.size.width;
        NSLog(@"笑没笑%d",faceFeature.hasSmile);
        // create a UIView using the bounds of the face
        UIView* faceView = [[UIView alloc] initWithFrame:faceFeature.bounds];
        
        // add a border around the newly created UIView
        
        faceView.layer.borderWidth = 1;
        faceView.layer.borderColor = [[UIColor redColor] CGColor];
        
        [self.view addSubview:faceView];
        
        if(faceFeature.hasLeftEyePosition)
            
        {
            // create a UIView with a size based on the width of the face
            
            UIView* leftEyeView = [[UIView alloc] initWithFrame:
                                   CGRectMake(faceFeature.leftEyePosition.x-faceWidth*0.15,
                                              faceFeature.leftEyePosition.y-faceWidth*0.15, faceWidth*0.3, faceWidth*0.3)];
            
            // change the background color of the eye view
            [leftEyeView setBackgroundColor:[[UIColor blueColor]
                                             colorWithAlphaComponent:0.3]];
            
            // set the position of the leftEyeView based on the face
            [leftEyeView setCenter:faceFeature.leftEyePosition];
            
            // round the corners
            leftEyeView.layer.cornerRadius = faceWidth*0.15;
            
            // add the view to the window
            [self.view  addSubview:leftEyeView];
            
        }
        
        if(faceFeature.hasRightEyePosition)
            
        {
            // create a UIView with a size based on the width of the face
            UIView* leftEye = [[UIView alloc] initWithFrame:
                               CGRectMake(faceFeature.rightEyePosition.x-faceWidth*0.15,
                                          faceFeature.rightEyePosition.y-faceWidth*0.15, faceWidth*0.3, faceWidth*0.3)];
            
            // change the background color of the eye view
            [leftEye setBackgroundColor:[[UIColor blueColor]
                                         colorWithAlphaComponent:0.3]];
            
            // set the position of the rightEyeView based on the face
            [leftEye setCenter:faceFeature.rightEyePosition];
            
            // round the corners
            leftEye.layer.cornerRadius = faceWidth*0.15;
            
            // add the new view to the window
            [self.view  addSubview:leftEye];
        }
        
        if(faceFeature.hasMouthPosition)
        {
            
            // create a UIView with a size based on the width of the face
            UIView* mouth = [[UIView alloc] initWithFrame:
                             CGRectMake(faceFeature.mouthPosition.x-faceWidth*0.2,
                                        faceFeature.mouthPosition.y-faceWidth*0.2, faceWidth*0.4, faceWidth*0.4)];
            
            // change the background color for the mouth to green
            [mouth setBackgroundColor:[[UIColor greenColor]
                                       colorWithAlphaComponent:0.3]];
            
            // set the position of the mouthView based on the face
            [mouth setCenter:faceFeature.mouthPosition];
            
            // round the corners
            mouth.layer.cornerRadius = faceWidth*0.2;
            
            // add the new view to the window
            [self.view  addSubview:mouth];
        }
        
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

