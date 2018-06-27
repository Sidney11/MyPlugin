//
//  Item2.m
//  MyPlugin
//
//  Created by xingzhan on 2018/4/4.
//  Copyright © 2018年 com.xz. All rights reserved.
//

#import "Item2.h"

@implementation Item2

+(instancetype)initItem2{
    return [[[NSBundle mainBundle]loadNibNamed:@"Item2" owner:nil options:nil]lastObject];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    self.backgroundColor=[UIColor orangeColor];
    return self;
}
@end
