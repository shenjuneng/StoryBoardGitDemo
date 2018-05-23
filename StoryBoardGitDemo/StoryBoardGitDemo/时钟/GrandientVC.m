//
//  GrandientVC.m
//  StoryBoardGitDemo
//
//  Created by 沈骏 on 2018/5/23.
//  Copyright © 2018年 沈骏. All rights reserved.
//

#import "GrandientVC.h"

@interface GrandientVC ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UISlider *redLocationSlider;

@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@end

@implementation GrandientVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:self.gradientLayer];
    
    self.gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    self.gradientLayer.locations = @[@0, @0.5];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    
    self.redLocationSlider.value = 0;
}

- (IBAction)changeRedLocation:(UISlider *)sender {
//     sender.value
    NSLog(@"%f", sender.value);
    NSArray *arr = self.gradientLayer.locations;
    CGFloat blueLocation = [arr[1] floatValue];
    NSArray *newArr = @[@(sender.value), @(blueLocation)];
    self.gradientLayer.locations = newArr;
}


@end
