//
//  KzCoreMotionManager.h
//  不规则图形
//
//  Created by KingZ on 15/11/5.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

typedef void(^AccelerometerBlock)(double x,double y,double z);

typedef void(^MagnetometerBlock)(double x,double y,double z);

typedef void(^DeviceMotionBlock)(double x,double y,double z);

@interface KzCoreMotionManager : NSObject


+ (instancetype)sharedInstance;

-(void)getAccelerometerWithBlock:(AccelerometerBlock)block;

-(void)getMagnetometerWithBlock:(MagnetometerBlock)block;

-(void)getDeviceMotionWithBlock:(DeviceMotionBlock)block;

@end
