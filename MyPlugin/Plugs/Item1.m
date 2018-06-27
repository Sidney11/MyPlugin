//
//  Item1.m
//  MyPlugin
//
//  Created by xingzhan on 2018/4/4.
//  Copyright © 2018年 com.xz. All rights reserved.
//

#import "Item1.h"

@implementation Item1
+(instancetype)initItem1{
    return [[[NSBundle mainBundle]loadNibNamed:@"Item1" owner:nil options:nil]lastObject];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    self.backgroundColor=[UIColor orangeColor];
    return self;
}

@end
