//
//  BlockTabbar.h
//  MyPlugin
//
//  Created by xingzhan on 2018/3/21.
//  Copyright © 2018年 com.xz. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BlockTabbar : UIView<UIScrollViewDelegate>
+(instancetype)initBlockTabbar;
-(void)setArray:(NSArray*) array;
@property (strong, nonatomic) IBOutlet UIStackView *basepanel;
@property (strong, nonatomic) IBOutlet UIScrollView *tabbar;
@property (strong, nonatomic) IBOutlet UIView *redblock;
@end
