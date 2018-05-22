//
//  ViewController.m
//  StoryBoardGitDemo
//
//  Created by 沈骏 on 2018/5/16.
//  Copyright © 2018年 沈骏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *hourHand;
@property (weak, nonatomic) IBOutlet UIImageView *minuteHand;
@property (weak, nonatomic) IBOutlet UIImageView *secondHand;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self tick];
}

- (void)tick {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    CGFloat hoursAngle = (components.hour / 12.0)*M_PI*2.0;
    CGFloat minsAngle = (components.minute / 60.0)*M_PI*2.0;
    CGFloat secsAngle = (components.second / 60.0)*M_PI*2.0;
    self.hourHand.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.minuteHand.transform = CGAffineTransformMakeRotation(minsAngle);
    self.secondHand.transform = CGAffineTransformMakeRotation(secsAngle);
}

@end
