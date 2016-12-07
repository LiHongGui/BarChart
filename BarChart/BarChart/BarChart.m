//
//  BarChart.m
//  BarChart
//
//  Created by lihonggui on 2016/12/7.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "BarChart.h"

@implementation BarChart


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSArray *dataArray = @[@10,@20,@15,@5,@30,@10,@10];
    for (int i = 0; i < dataArray.count; i++) {
        //平分---总共13个宽
        CGFloat width = rect.size.width/(2*dataArray.count - 1);
        CGFloat x = width*2*i;
        CGFloat height = [dataArray[i]floatValue] /50 *rect.size.height;
        CGFloat y = rect.size.height - height-200;
        CGContextRef context = UIGraphicsGetCurrentContext();
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y , width,height)];
        CGContextAddPath(context ,path.CGPath);
        [[self color]setFill];
        [path fill];
    }
}
-(UIColor *)color
{
    CGFloat red = arc4random_uniform(256)/255.0;
    CGFloat green = arc4random_uniform(256)/255.0;
    CGFloat blue = arc4random_uniform(256)/255.0;
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    return randomColor;
}
#pragma mark
#pragma mark -  点击屏幕,随机变换颜色
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //重新画图
    [self setNeedsDisplay];
}

@end
