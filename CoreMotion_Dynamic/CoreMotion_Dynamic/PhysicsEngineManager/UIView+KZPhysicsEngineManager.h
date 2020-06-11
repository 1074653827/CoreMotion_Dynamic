//
//  UIView+KZPhysicsEngineManager.h
//  不规则图形
//
//  Created by KingZ on 15/11/10.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KZPhysicsEngineManager;

@interface UIView (KZPhysicsEngineManager)

- (void)pem_DynamicAnimator:(void(^)(KZPhysicsEngineManager* pem))block;

- (void)pem_CollisionBehaviorBlock:(void(^)(UICollisionBehavior*collision))block;

- (void)pem_PushBehaviorMode:(UIPushBehaviorMode)mode Block:(void(^)(UIPushBehavior*))block;

- (void)pem_DynamicItemBehavior:(UIDynamicBehavior*)behavior Block:(void(^)(UIDynamicItemBehavior* itemBehavior))block;

@end
