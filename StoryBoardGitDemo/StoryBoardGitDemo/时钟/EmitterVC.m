//
//  EmitterVC.m
//  StoryBoardGitDemo
//
//  Created by 沈骏 on 2018/5/23.
//  Copyright © 2018年 沈骏. All rights reserved.
//

#import "EmitterVC.h"

@interface EmitterVC ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation EmitterVC

- (void)viewDidLoad {
    [super viewDidLoad];

    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:emitter];
    
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width, 0);
    emitter.emitterShape = kCAEmitterLayerOutline;
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"Snow"].CGImage;
    cell.birthRate = 10;
    cell.lifetime = 10.0;
    cell.color = [UIColor whiteColor].CGColor;
    cell.velocity = 40;
    cell.velocityRange = 100;
    cell.yAcceleration = 8;
    cell.emissionLongitude = M_PI;
    cell.emissionRange = M_PI_4;
    cell.scale = 0.2;
    cell.scaleRange = 0.1;
    cell.scaleSpeed = 0.01;
    cell.alphaRange = 0.8;
    cell.redRange = 0.8;
    cell.greenRange = 0.8;
    cell.blueRange = 0.8;
    emitter.emitterCells = @[cell];
    
}

@end
