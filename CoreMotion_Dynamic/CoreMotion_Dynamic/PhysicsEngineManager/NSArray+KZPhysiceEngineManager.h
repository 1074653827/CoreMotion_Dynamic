//
//  NSArray+KZPhysiceEngineManager.h
//  不规则图形
//
//  Created by KingZ on 15/11/10.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class KZKZPhysicsEngineManager;

@interface NSArray (PhysiceEngineManager)

- (void)pem_CollisionBehaviorBlock:(void(^)(UICollisionBehavior*collision))block;

- (void)pem_PushBehaviorMode:(UIPushBehaviorMode)mode Block:(void(^)(UIPushBehavior*))block;

- (void)pem_DynamicItemBehavior:(UIDynamicBehavior*)behavior Block:(void(^)(UIDynamicItemBehavior* itemBehavior))block;

@end
