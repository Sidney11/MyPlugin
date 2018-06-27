//
//  StretchTextField.h
//  MyPlugin
//
//  Created by xingzhan on 2018/3/20.
//  Copyright © 2018年 com.xz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StretchTextField : UIView<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textfield;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic)UIImage *buttonImage;
@property (strong,nonatomic)UIImage *image;
+(instancetype)initStretchText;
-(void)setPlugImage:(UIImage *)image :(UIImage *)buttonImage;
@end
