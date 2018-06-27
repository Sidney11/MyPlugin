//
//  BlockTabbar.m
//  MyPlugin
//
//  Created by xingzhan on 2018/3/21.
//  Copyright © 2018年 com.xz. All rights reserved.
//

#import "BlockTabbar.h"
CGFloat buttonWidth=100;
CGRect screen;
CGFloat blockHeight=5;
CGFloat scrollPosition;
@implementation BlockTabbar
+(instancetype)initBlockTabbar{
    return [[[NSBundle mainBundle]loadNibNamed:@"BlockTabbar" owner:nil options:nil]lastObject];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
-(void)setArray:(NSArray*) array{
    screen=[[UIScreen mainScreen]bounds];
    [self.tabbar setFrame:CGRectMake(0, 0, screen.size.width, 50)];
    self.tabbar.contentSize=CGSizeMake(buttonWidth*array.count, 50);
    CGFloat x=0;
    for(int i=0;i<array.count;i++){
        UIButton *temp=[[UIButton alloc]initWithFrame:CGRectMake(x, 0, buttonWidth, 40)];
        //[temp setBackgroundColor:[UIColor orangeColor]];
        [temp setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [temp setTitle:array[i] forState:UIControlStateNormal];
        temp.tag=i;
        [temp addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabbar addSubview:temp];
        x+=100;
    }
    
    self.tabbar.delegate=self;
}
-(void)onClick:(id)sender{
    UIButton *btn=(UIButton*)sender;
    float harf=screen.size.width/2-btn.frame.size.width/2;
    float moveX=btn.frame.origin.x-harf;
    if(moveX<0){
        moveX=0;
    }
    else if((self.tabbar.contentSize.width-moveX)<screen.size.width){
        moveX=self.tabbar.contentSize.width-screen.size.width;
    }
    [self.tabbar setContentOffset:CGPointMake(moveX,0) animated:YES];
    [UIView animateWithDuration:0.2 animations:^{
        self.redblock.frame = CGRectMake(btn.frame.origin.x-moveX, self.tabbar.frame.size.height, btn.frame.size.width, self.redblock.frame.size.height);
    }];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    scrollPosition=scrollView.contentOffset.x;
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}
@end
