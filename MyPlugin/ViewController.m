//
//  ViewController.m
//  MyPlugin
//
//  Created by xingzhan on 2018/3/20.
//  Copyright © 2018年 com.xz. All rights reserved.
//

#import "ViewController.h"
#import "StretchTextField.h"
#import "BlockTabbar.h"
#import "RotateMenu.h"
#import "XLWave.h"
#import "SlideViewController.h"
#import "SpringEffect.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txt;
@end

@implementation ViewController
XLWave *wave;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screen=[[UIScreen mainScreen]bounds];
    
    StretchTextField *text=[StretchTextField initStretchText];
    UIImage *buttonImage=[UIImage imageNamed:@"sound.png"];
    UIImage *image=[UIImage imageNamed:@"logo.png"];
    [text setPlugImage:image :buttonImage];
    [text setFrame:CGRectMake(0, 100, screen.size.width, 50)];
    [self.view addSubview:text];
    
    BlockTabbar *tabbar=[BlockTabbar initBlockTabbar];
    NSArray *arr=[NSArray arrayWithObjects:@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"night", nil];
    [tabbar setArray:arr];
    [tabbar setFrame:CGRectMake(0, 200, screen.size.width,50)];
    [self.view addSubview:tabbar];
    
    NSArray *img=[NSArray arrayWithObjects:[UIImage imageNamed:@"logo5.png"],[UIImage imageNamed:@"logo1.png"],[UIImage imageNamed:@"logo2.png"],[UIImage imageNamed:@"logo3.png"],[UIImage imageNamed:@"logo4.png"],[UIImage imageNamed:@"logo0.png"], nil];
    RotateMenu *rotatemenu=[[RotateMenu alloc]initWithFrame:CGRectMake(200, 300, 64, 64) ];
    [rotatemenu setArray:img];
    [self.view addSubview:rotatemenu];
    
    wave=[[XLWave alloc]initWithFrame:CGRectMake(200, 400, 100, 100)];
    [self.view addSubview:wave];
    UISlider *slider=[[UISlider alloc]initWithFrame:CGRectMake(200, 520, 100, 50)];
    slider.minimumValue=0.0f;
    slider.maximumValue=1.0f;
    slider.value=0.0f;
    [slider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    UIImageView *head=[[UIImageView alloc]initWithFrame:CGRectMake(0, 400, 100, 100)];
    head.image=[UIImage imageNamed:@"head.jpg"];
    head.layer.cornerRadius=head.frame.size.width/2;
    head.layer.masksToBounds=YES;
    head.layer.borderWidth=1.5f;
    head.layer.borderColor=[UIColor grayColor].CGColor;
    [self.view addSubview:head];
    
    SpringEffect *springEffect=[[SpringEffect alloc]initWithFrame:CGRectMake(0, 0, screen.size.width, 100)];
    springEffect.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:springEffect];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)editEnd:(id)sender {
    //self.textfield.transform=CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        self.txt.transform=CGAffineTransformMakeScale(1.0, 1.0);
        //self.button.transform=CGAffineTransformMakeTranslation(0, 0);
        //self.imageView.transform=CGAffineTransformMakeTranslation(0, 0);
    }];
}
- (IBAction)beginEdit:(id)sender {
    [UIView animateWithDuration:1.0f animations:^{
        self.txt.transform=CGAffineTransformMakeScale(1.3, 1.0);
        //self.button.transform=CGAffineTransformMakeTranslation(40, 0);
        //self.imageView.transform=CGAffineTransformMakeTranslation(-40, 0);
    }];
}
-(IBAction)sliderChange:(UISlider*)slider{
    [wave setProgress:slider.value];
}
- (IBAction)slideMenu:(id)sender {
    SlideViewController *slideMenu=[[SlideViewController alloc]init];
    [self presentViewController:slideMenu animated:UIModalTransitionStyleCrossDissolve completion:nil];
}
@end
