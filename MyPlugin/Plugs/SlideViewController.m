//
//  SlideViewController.m
//  MyPlugin
//
//  Created by xingzhan on 2018/4/4.
//  Copyright © 2018年 com.xz. All rights reserved.
//

#import "SlideViewController.h"
#import "Item1.h"
#import "Item2.h"

@interface SlideViewController ()
@property (strong, nonatomic) IBOutlet UIView *menuView;
@end

@implementation SlideViewController

UIView *view;
CGFloat distance;
CGFloat screenWidth;
CGFloat screenHeight;
CGPoint beginPoint;

bool isMoved=false;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen=[[UIScreen mainScreen]bounds];
    distance=screen.size.width*0.75;
    screenWidth=screen.size.width;
    screenHeight=screen.size.height;
    
    _menuView.alpha=0;
    
    view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height)];
    view.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:view];
}

- (IBAction)returnClick:(id)sender {
    UIViewController *rootVC=self.presentingViewController;
    UIViewController *bottomVC;
    while(rootVC){
        bottomVC=rootVC;
        rootVC=rootVC.presentingViewController;
        NSLog(@"有:%s,%s",object_getClassName(bottomVC),object_getClassName(rootVC));
    }
    [bottomVC dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//记录开始位置
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch=[touches anyObject];
    beginPoint=[touch locationInView:view];
    isMoved=true;
}
//计算滑动距离
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    if(!isMoved){
        return;
    }
    @autoreleasepool{
        UITouch *touch=[touches anyObject];
        CGPoint point=[touch locationInView:view];
        if(point.x-beginPoint.x>20){
            [UIView animateWithDuration:0.5f animations:^{
                _menuView.transform=CGAffineTransformMakeTranslation(60, 0);
                _menuView.alpha=1;
                
                view.center=CGPointMake(screenWidth,view.center.y);
                view.transform=CGAffineTransformMakeScale(0.8f, 0.8f);
                view.layer.opacity=0.2f;
            }];
        }
    }
}
//返回滑行窗口
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:view];
    if(point.x<0){
        [self animateBegin];
    }
}
- (IBAction)item1Click:(id)sender {
    [view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    Item1 *item1=[Item1 initItem1];
    item1.frame=CGRectMake(0, 0, 200, 200);
    [view addSubview:item1];
    
    [self animateEnd];
}
- (IBAction)item2Click:(id)sender {
    [view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    Item2 *item2=[Item2 initItem2];
    item2.frame=CGRectMake(100, 100, 200, 200);
    [view addSubview:item2];
    
    [self animateEnd];
}

- (void)animateBegin {
    [UIView animateWithDuration:0.5f animations:^{
        _menuView.transform=CGAffineTransformMakeTranslation(0, 0);
        _menuView.alpha=0;
        
        view.center=CGPointMake(screenWidth/2,screenHeight/2);
        view.transform=CGAffineTransformMakeScale(1, 1);
        view.layer.opacity=1.0f;
    }];
    isMoved=false;
}
- (void)animateEnd {
    [UIView animateWithDuration:0.5f animations:^{
        _menuView.transform=CGAffineTransformMakeTranslation(0, 0);
        _menuView.alpha=0;
        
        view.center=CGPointMake(screenWidth/2,screenHeight/2);
        view.transform=CGAffineTransformMakeScale(1, 1);
        view.layer.opacity=1.0f;
    }];
    isMoved=false;
}
@end
