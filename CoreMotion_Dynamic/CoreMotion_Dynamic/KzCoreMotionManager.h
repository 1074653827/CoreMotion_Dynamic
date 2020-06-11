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
/**
 加速度
 */
-(void)getAccelerometerWithBlock:(AccelerometerBlock)block;
/**
 磁场
 */
-(void)getMagnetometerWithBlock:(MagnetometerBlock)block;
/**
 运动
 */
-(void)getDeviceMotionWithBlock:(DeviceMotionBlock)block;

@end
