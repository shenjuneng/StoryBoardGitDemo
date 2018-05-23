//
//  SJClockView.m
//  StoryBoardGitDemo
//
//  Created by 沈骏 on 2018/5/22.
//  Copyright © 2018年 沈骏. All rights reserved.
//

#import "SJClockView.h"

@implementation SJClockView

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    _enableGraduations = YES;
    
    _faceBackgroundColor = [UIColor colorWithRed:0 green:122.0/255.0 blue:255/255 alpha:1];
    _faceBackgroundAlpha = 0.95;
    
    _borderColor = [UIColor whiteColor];
    _borderAlpha = 1.0;
    _borderWidth = 3;
}

#pragma mark - Drawings

- (void)drawRect:(CGRect)rect {
    // clock face
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColorWithColor(ctx, _faceBackgroundColor.CGColor);
    CGContextSetAlpha(ctx, _faceBackgroundAlpha);
    CGContextFillPath(ctx);
    
    // clock border
    CGContextAddEllipseInRect(ctx, CGRectMake(rect.origin.x + _borderWidth/2, rect.origin.y + _borderWidth/2, rect.size.width - _borderWidth, rect.size.height - _borderWidth));
    CGContextSetStrokeColorWithColor(ctx, _borderColor.CGColor);
    CGContextSetAlpha(ctx, _borderAlpha);
    CGContextSetLineWidth(ctx, _borderWidth);
    CGContextStrokePath(ctx);
    
    // clock graduation
    if (_enableGraduations == YES) {
        UIColor *graduationColor = [UIColor whiteColor];
        CGFloat graduationAlpha = 1.0;
        CGFloat graduationWidth = 1.0;
        CGFloat graduationLength = 5.0;
        CGFloat graduationOffset = 10.0;
        for (int i = 0; i < 60; i++) {
            if (i%5== 0) {
                graduationLength = 20.0;
            } else {
                graduationLength = 5.0;
            }
            
            if (i%15 == 0) {
                graduationColor = [UIColor blueColor];
            } else {
                graduationColor = [UIColor whiteColor];
            }
            NSLog(@"%f", graduationOffset);
            CGFloat x1F = ((self.frame.size.width - 2 * graduationOffset) * 0.5) * sin(i * (M_PI / 30));
            CGFloat p1x = self.frame.size.width * 0.5 + x1F;

            CGFloat y1F = ((self.frame.size.height - 2 * graduationOffset) * 0.5) * cos(i * (M_PI / 30));
            CGFloat p1y = self.frame.size.height * 0.5 + y1F;
        
            CGFloat x2F = ((self.frame.size.width - 2 * graduationLength - 2 * graduationOffset) * 0.5) * sin(i * (M_PI / 30));
            CGFloat p2x = self.frame.size.width * 0.5 + x2F;
            
            CGFloat y2F = ((self.frame.size.height - 2 * graduationLength - 2 * graduationOffset) * 0.5) * cos(i * (M_PI / 30));
            CGFloat p2y = self.frame.size.height * 0.5 + y2F;
            
            CGPoint P1 = CGPointMake(p1x, p1y);
            CGPoint P2 = CGPointMake(p2x, p2y);
            
//            CGContextMoveToPoint(ctx, P1.x, P1.y);
//            CGContextAddLineToPoint(ctx, P2.x, P2.y);
//            CGContextSetStrokeColorWithColor(ctx, graduationColor.CGColor);
//            CGContextSetLineWidth(ctx, graduationWidth);
//            CGContextSetAlpha(ctx, graduationAlpha);
//            CGContextStrokePath(ctx);
            CAShapeLayer  *shapeLayer = [CAShapeLayer layer];
            UIBezierPath *path1 = [UIBezierPath bezierPath];
            shapeLayer.path = path1.CGPath;
            [path1 setLineWidth:graduationWidth];
            [path1 moveToPoint:P1];
            [path1 addLineToPoint:P2];
            path1.lineCapStyle = kCGLineCapSquare;
            [graduationColor set];
            [path1 strokeWithBlendMode:kCGBlendModeNormal alpha:graduationAlpha];
        }
    }
}

@end
