//
//  KzCoreMotionManager.m
//  不规则图形
//
//  Created by KingZ on 15/11/5.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import "KzCoreMotionManager.h"

@interface KzCoreMotionManager ()
{
    CMMotionManager* _motionManager;
}


@end

@implementation KzCoreMotionManager

+ (instancetype)sharedInstance{
    static KzCoreMotionManager* this = nil;
    
    if (!this) {
        this = [[KzCoreMotionManager alloc]init];
    }
    
    return this;

}

-(instancetype)init{
    if (self == [super init])
    {
        [self createUpMotionManager];
        
    }

    return self;
}

- (void)createUpMotionManager{
    
    _motionManager = [[CMMotionManager alloc]init];
    
    
    
}

-(void)getAccelerometerWithBlock:(AccelerometerBlock)block{
    
    _motionManager.accelerometerUpdateInterval = 0.5;
    
    if (!_motionManager.accelerometerAvailable) {
        
        NSLog(@"不可用");
        return;
    }
    
    [_motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        
        CMAccelerometerData* accel = accelerometerData;
        
        
        if (block) {
            
            block(accel.acceleration.x,accel.acceleration.y,accel.acceleration.z);
        }
        
        
        
    }];
    
    
    
}
-(void)stopAccelerometer{
    
    [_motionManager stopAccelerometerUpdates];

}

-(void)getMagnetometerWithBlock:(MagnetometerBlock)block{
    
    if (!_motionManager.magnetometerAvailable) {
        
        return;
    }
    _motionManager.magnetometerUpdateInterval = 0.01;

    [_motionManager startMagnetometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMMagnetometerData *magnetometerData, NSError *error) {
        
        if (block) {
            
            block(magnetometerData.magneticField.x,magnetometerData.magneticField.y,magnetometerData.magneticField.z);
        }
        
    }];

}

-(void)getDeviceMotionWithBlock:(DeviceMotionBlock)block{
    
    if (!_motionManager.deviceMotionAvailable) {
        
        return;
    }
    _motionManager.deviceMotionUpdateInterval = 0.1;
    
    [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        
        if (block) {
            
            block(motion.userAcceleration.x,motion.userAcceleration.y,motion.userAcceleration.z);
        }
        
    }];

}



@end
