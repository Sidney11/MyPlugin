//
//  StretchTextField.m
//  MyPlugin
//
//  Created by xingzhan on 2018/3/20.
//  Copyright © 2018年 com.xz. All rights reserved.
//

#import "StretchTextField.h"

CGFloat viewHeight=50;
CGFloat margin=10;

CGFloat buttonX=150;
CGFloat buttonY=0;
CGFloat buttonW=60;
CGFloat buttonH=30;

CGFloat imageX=0;
CGFloat imageY=0;
CGFloat imageW=30;
CGFloat imageH=30;

CGFloat textFieldX=0;
CGFloat textFieldY=0;
CGFloat textFieldW=100;
CGFloat textFieldH=30;

@implementation StretchTextField

+(instancetype)initStretchText{
    return [[[NSBundle mainBundle]loadNibNamed:@"StretchTextField" owner:nil options:nil]lastObject];
}

 -(void)layoutSubviews{
     [super layoutSubviews];
     //[self.textfield addTarget:self action:@selector(beginEdit:) forControlEvents:UIControlEventEditingDidBegin];
     //[self.textfield addTarget:self action:@selector(endEdit:) forControlEvents:UIControlEventEditingDidEnd];
 }
-(void)setPlugImage:(UIImage *)image :(UIImage *)buttonImage{
    self.image=image;
    self.buttonImage=buttonImage;
    [self.imageView setImage:self.image];
    [self.button setImage:self.buttonImage forState:UIControlStateNormal];
    
    self.textfield.layer.borderWidth=1.0f;
    self.textfield.layer.borderColor=[UIColor colorWithRed:0xbf/255.0f green:0xbf/255.0f blue:0xbf/255.0f alpha:1].CGColor;
    //设置文本框角度
    self.textfield.layer.cornerRadius=15;
    self.textfield.leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 16, 51)];
    self.textfield.leftViewMode=UITextFieldViewModeAlways;
    self.textfield.placeholder=@"搜索";
    //数字键盘+搜索中文
    self.textfield.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    self.textfield.returnKeyType=UIReturnKeySearch;
    self.textfield.delegate=self;
    [self.textfield endEditing:YES];
    
}
- (IBAction)beginEdit:(id)sender {
    //self.textfield.transform=CGAffineTransformMakeScale(1.3, 1.0);
    [UIView animateWithDuration:1.0f animations:^{
        self.textfield.transform=CGAffineTransformMakeScale(1.5, 1.0);
        self.button.transform=CGAffineTransformMakeTranslation(40, 0);
        self.imageView.transform=CGAffineTransformMakeTranslation(-70, 0);
    }];
}
- (IBAction)endEdit:(id)sender {
    //self.textfield.transform=CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        self.textfield.transform=CGAffineTransformMakeScale(1.0, 1.0);
        self.button.transform=CGAffineTransformMakeTranslation(0, 0);
        self.imageView.transform=CGAffineTransformMakeTranslation(0, 0);
    }];
}
//改变键盘右下角的换行键为完成键，实现代理方法键盘自动回弹
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //取消第一响应
    [textField resignFirstResponder];
    return YES;
}
@end
