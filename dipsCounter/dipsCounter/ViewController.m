//
//  ViewController.m
//  dipsCounter
//
//  Created by Aleksey Tyurenkov on 10/28/14.
//  Copyright (c) 2014 com.epam. All rights reserved.
//

#import "ViewController.h"

static const float kAccelerometerFrequency = 1/10.0f; //Hz

@interface ViewController ()

@property (nonatomic, strong) CMMotionManager *motionManager;
@property (weak, nonatomic) IBOutlet UILabel *centerLabel;
@property (nonatomic,assign) float velocity;
@property (nonatomic, assign) float distance;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Configuring the accelerometer

-(CMMotionManager *)motionManager
{
    
    if (!_motionManager)
    {
        _motionManager = [[CMMotionManager alloc] init];
        _motionManager.deviceMotionUpdateInterval = kAccelerometerFrequency;
    }
    
    return _motionManager;
}

- (void) startCount
{

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    __weak ViewController* weakSelf = self;
    [self.motionManager startDeviceMotionUpdatesToQueue:queue withHandler:^(CMDeviceMotion *motion, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            float acceleration = [motion verticalAcceleration];
            weakSelf.distance += weakSelf.velocity* kAccelerometerFrequency + acceleration*kAccelerometerFrequency*kAccelerometerFrequency / 2;
            weakSelf.velocity += acceleration * kAccelerometerFrequency;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                weakSelf.centerLabel.text = [NSString stringWithFormat:@"%f",weakSelf.distance];
            }];

        });
    }];

}
@end
