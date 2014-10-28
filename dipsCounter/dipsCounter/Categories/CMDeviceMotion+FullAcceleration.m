//
//  CMDeviceMotion+FullAcceleration.m
//  dipsCounter
//
//  Created by Aleksey Tyurenkov on 10/28/14.
//  Copyright (c) 2014 com.epam. All rights reserved.
//

#import "CMDeviceMotion+FullAcceleration.h"

@implementation CMDeviceMotion (FullAcceleration)
- (float)fullAcceleration
{
    return sqrt(self.userAcceleration.x*self.userAcceleration.x +
                self.userAcceleration.y*self.userAcceleration.y +
                self.userAcceleration.z*self.userAcceleration.z
                );
}
@end
