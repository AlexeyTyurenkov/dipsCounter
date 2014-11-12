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
    return [self accelerationModule:self.userAcceleration];
}

- (float)fullGravity
{
    return [self accelerationModule:self.gravity];
}

- (float)verticalAcceleration
{
    CMAcceleration vertical = [self gravityVector];
    return ([self scalarProduct:vertical :self.userAcceleration] / [self accelerationModule:vertical])/9.81;
}

- (CMAcceleration) gravityVector
{
    CMAcceleration vector;
    vector.x = self.gravity.x - self.userAcceleration.x;
    vector.y = self.gravity.y - self.userAcceleration.y;
    vector.z = self.gravity.z - self.userAcceleration.z;
    return vector;
}



- (float) accelerationModule:(CMAcceleration)a
{
    return sqrt(a.x*a.x + a.y*a.y + a.z*a.z);
}

- (float) scalarProduct:(CMAcceleration)a :(CMAcceleration)b
{
    return a.x*b.x + a.y*b.y + a.z*b.z;
}
@end
