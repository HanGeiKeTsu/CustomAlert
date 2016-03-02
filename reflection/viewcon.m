//
//  viewcon.m
//  reflection
//
//  Created by iOS Dev on 16/2/29.
//  Copyright © 2016年 iOS Dev. All rights reserved.
//

#import "viewcon.h"
#import "ZXPAutoLayout.h"
#import "StepManager.h"

@implementation viewcon


-(void)viewDidLoad
{
//    [self otherLayout];
    [self createTab];
}
- (void)otherLayout
{
    UIView *view = [UIView new];
    self.view.backgroundColor = [UIColor whiteColor];
    view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view];
    [view zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.edgeInsets(UIEdgeInsetsMake(100, 100, 100, 100));
    }];
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor brownColor];
    [view addSubview:view1];
    [view1 zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.topSpaceByView (view, 10);
        
        layout.leftSpaceEqualTo(view,0);
        
        layout.widthEqualTo(view,0).multiplier(0.5);
        layout.heightValue(40); //设置高度
    }];
}
-(void)createTab
{
    UITableView *tab = [[UITableView alloc] initWithFrame:self.view.frame];
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView zxp_cellHeightWithindexPath:indexPath space:40];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentify];
    }
    //cell init
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[StepManager sharedStepManager] addStep:[NSString stringWithFormat:@"A%ld",indexPath.row]];
}
@end
