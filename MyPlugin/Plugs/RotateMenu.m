//
//  RotateMenu.m
//  MyPlugin
//
//  Created by xingzhan on 2018/3/28.
//  Copyright © 2018年 com.xz. All rights reserved.
//

#import "RotateMenu.h"

@implementation RotateMenu
NSMutableArray *buttonArray;
bool flag=false;
float animateTime=0.2f;
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    return self;
}
-(void)setArray:(NSArray *)array{
    buttonArray=[NSMutableArray arrayWithCapacity:array.count];
    for(int i=0;i<array.count;i++){
        UIImage *img=array[i];
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 48, 48)];
        btn.alpha=0;
        [btn setImage:img forState:UIControlStateNormal];
        if(i==array.count-1){
            [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.alpha=1;
        }
        [buttonArray addObject:btn];
        [self addSubview:btn];
    }
}
-(void)onClick:(id)sender{
    if(!flag){
        [self animateA];
    }
    else{
        [self animateABack];
    }
}
-(void)animateA{
    flag=true;
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[0];
        btn.transform=CGAffineTransformMakeTranslation(-70,0);
        btn.alpha=1;
    }];
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[1];
        btn.transform=CGAffineTransformMakeTranslation(-50, -50);
        btn.alpha=1;
    }];
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[2];
        btn.transform=CGAffineTransformMakeTranslation(0, -70);
        btn.alpha=1;
    }];
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[3];
        btn.transform=CGAffineTransformMakeTranslation(50, -50);
        btn.alpha=1;
    }];
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[4];
        btn.transform=CGAffineTransformMakeTranslation(70, 0);
        btn.alpha=1;
    }];
}
-(void)animateABack{
    flag=false;
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[0];
        btn.transform=CGAffineTransformMakeTranslation(0,0);
        btn.alpha=0;
    }];
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[1];
        btn.transform=CGAffineTransformMakeTranslation(0, 0);
        btn.alpha=0;
    }];
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[2];
        btn.transform=CGAffineTransformMakeTranslation(0, 0);
        btn.alpha=0;
    }];
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[3];
        btn.transform=CGAffineTransformMakeTranslation(0, 0);
        btn.alpha=0;
    }];
    [UIView animateWithDuration:animateTime animations:^{
        UIButton *btn=(UIButton*)buttonArray[4];
        btn.transform=CGAffineTransformMakeTranslation(0, 0);
        btn.alpha=0;
    }];
}

@end
