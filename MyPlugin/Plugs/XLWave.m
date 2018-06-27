//
//  XLWave.m
//  MyPlugin
//
//  Created by xingzhan on 2018/4/2.
//  Copyright © 2018年 com.xz. All rights reserved.
//
#define BackGroundColor [UIColor colorWithRed:96/255.0f green:159/255.0f blue:150/255.0f alpha:1]
#define WaveColor1 [UIColor colorWithRed:136/255.0f green:199/255.0f blue:190/255.0f alpha:1]
#define WaveColor2 [UIColor colorWithRed:28/255.0f green:203/255.0f blue:174/255.0f alpha:1]
#import "XLWave.h"
@interface XLWave(){
    //前面的波浪
    CAShapeLayer *_waveLayer1;
    CAShapeLayer *_waveLayer2;
    CADisplayLink *_disPlayLink;
    //曲线的振幅
    CGFloat _waveAmplitude;
    //曲线角度
    CGFloat _wavePalstance;
    //曲线初相
    CGFloat _waveX;
    //偏距
    CGFloat _waveY;
    //曲线移动速度
    CGFloat _waveMoveSpeed;
    CGFloat _progress;
}
@end

@implementation XLWave
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    [self buildUI];
    [self buildData];
    return self;
}
//初始化UI
-(void)buildUI{
    //初始化波浪
    //底层
    _waveLayer1=[CAShapeLayer layer];
    _waveLayer1.fillColor=WaveColor1.CGColor;
    _waveLayer1.strokeColor=WaveColor1.CGColor;
    [self.layer addSublayer:_waveLayer1];
    //上层
    _waveLayer2=[CAShapeLayer layer];
    _waveLayer2.fillColor=WaveColor2.CGColor;
    _waveLayer2.strokeColor=WaveColor2.CGColor;
    [self.layer addSublayer:_waveLayer2];
    //画了个圈
    self.layer.cornerRadius=self.bounds.size.width/2.0f;
    self.layer.masksToBounds=true;
    self.backgroundColor=BackGroundColor;
}
//初始化数据
-(void)buildData{
    //振幅
    _waveAmplitude=10;
    //角速度
    _wavePalstance=M_PI/self.bounds.size.width;
    //偏距
    _waveY=0;
    //初相
    _waveX=0;
    //x轴移动速度
    _waveMoveSpeed=_wavePalstance*2;
    //以屏幕刷新速度为周期刷新曲线位置
    _disPlayLink=[CADisplayLink displayLinkWithTarget:self selector:@selector(updateWave:)];
    [_disPlayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
//保持和屏幕的刷新速度相同,iphone的刷新速度是60Hz,即每秒60次的刷新
-(void)updateWave:(CADisplayLink*)link{
    //更新x
    _waveX+=_waveMoveSpeed;
    [self updateWaveY];
    [self updateWave1];
    [self updateWave2];
}
//更新偏距的大小,直到达到目标偏距让wave有一个匀速增长的效果
-(void)updateWaveY{
    CGFloat targetY=self.bounds.size.height-_progress*self.bounds.size.height;
    if(_waveY<targetY){
        _waveY+=2;
    }
    if(_waveY>targetY){
        _waveY-=2;
    }
}
//更新第一层曲线
-(void)updateWave1{
    //波浪宽度
    CGFloat waterWaveWidth=self.bounds.size.width;
    //初始化运动路径
    CGMutablePathRef path=CGPathCreateMutable();
    //设置起始位置
    CGPathMoveToPoint(path, nil, 0, _waveY);
    //初始化波浪y为偏距
    CGFloat y=_waveY;
    //正弦曲线公式为:y=Asin(wx+o)+k
    for(float x=0.0f;x<waterWaveWidth;x++){
        y=_waveAmplitude*cos(_wavePalstance*x+_waveX)+_waveY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    //填充底部颜色
    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.bounds.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
    CGPathCloseSubpath(path);
    _waveLayer1.path=path;
    CGPathRelease(path);
}
//更新第二层曲线
-(void)updateWave2{
    //波浪宽度
    CGFloat waterWaveWidth=self.bounds.size.width;
    //初始化运动路径
    CGMutablePathRef path=CGPathCreateMutable();
    //设置起始位置
    CGPathMoveToPoint(path, nil, 0, _waveY);
    //初始化波浪起始偏距Y
    CGFloat y=_waveY;
    //正弦公式为:y=Asin(wx+o)+k
    for(float x=0.0f;x<=waterWaveWidth;x++){
        y=_waveAmplitude*sin(_wavePalstance*x+_waveX)+_waveY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    //添加终点路径，填充底部颜色
    CGPathAddLineToPoint(path, nil, waterWaveWidth, self.bounds.size.height);
    CGPathAddLineToPoint(path, nil, 0,self.bounds.size.height);
    CGPathCloseSubpath(path);
    _waveLayer2.path=path;
    CGPathRelease(path);
}
//设置需要显示的进度，y轴的更新会在[updateWaveY】方法中实现
-(void)setProgress:(CGFloat)progress{
    _progress=progress;
}
//停止动画
-(void)stop{
    if(_disPlayLink){
        [_disPlayLink invalidate];
        _disPlayLink=nil;
    }
}
//回收内存
-(void)dealloc{
    [self stop];
    if(_waveLayer1){
        [_waveLayer1 removeFromSuperlayer];
        _waveLayer1=nil;
    }
    if(_waveLayer2){
        [_waveLayer2 removeFromSuperlayer];
        _waveLayer2=nil;
    }
}
@end
