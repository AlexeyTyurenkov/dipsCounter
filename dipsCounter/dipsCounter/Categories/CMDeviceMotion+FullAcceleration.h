//
//  CMDeviceMotion+FullAcceleration.h
//  dipsCounter
//
//  Created by Aleksey Tyurenkov on 10/28/14.
//  Copyright (c) 2014 com.epam. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

@interface CMDeviceMotion (FullAcceleration)
- (float)fullAcceleration;
- (float)verticalAcceleration;
@end
