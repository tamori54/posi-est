//
//  circle.m
//  iBeaconTest00
//
//  Created by aiel on 2015/10/16.
//  Copyright (c) 2015年 tikomo. All rights reserved.
//

#import "circle.h"

@implementation circle

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 線の幅
    CGFloat lineW = 5.0;
    //線の色
    [[UIColor redColor]setStroke];
    //塗り色
    [[UIColor clearColor]setFill];
    //領域
    CGFloat width = self.bounds.size.width - lineW;
    CGFloat height = self.bounds.size.height - lineW;
    CGRect theRect = CGRectMake(lineW/2, lineW/2, width, height);
    //図形のパス
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:theRect];
    //線幅
    circle.lineWidth = lineW;
    //パスを塗りつぶす
    [circle fill];
    //パスを描く
    [circle stroke];
    
}


@end
