//
//  ViewController.m
//  dipsCounter
//
//  Created by Aleksey Tyurenkov on 10/28/14.
//  Copyright (c) 2014 com.epam. All rights reserved.
//

#import "ViewController.h"

static const float kAccelerometerFrequency = 1/50.0f; //Hz

@interface ViewController ()

@property (nonatomic, strong) CMMotionManager *motionManager;
@property (weak, nonatomic) IBOutlet UILabel *centerLabel;

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
    __weak UILabel* motionLabel = self.centerLabel;
        [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue new] withHandler:^(CMDeviceMotion *motion, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                motionLabel.text = [NSString stringWithFormat:@"%f",[motion fullAcceleration]];
                NSLog(@"%@",motionLabel.text);
            });
        }];
}
@end
