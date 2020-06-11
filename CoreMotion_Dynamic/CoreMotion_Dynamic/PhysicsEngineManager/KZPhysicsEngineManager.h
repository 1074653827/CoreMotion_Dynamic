//
//  KZPhysicsEngineManager.h
//  不规则图形
//
//  Created by KingZ on 15/11/10.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface KZPhysicsEngineManager : NSObject

+ (instancetype)sharedInstance;



- (void)DynamicAnimatorWithReferenceView:(UIView*)referenceView;

- (void)CollisionBehavior:(NSArray *)items Block:(void(^)(UICollisionBehavior* collision))block;

- (void)PushBehavior:(NSArray*)items mode:(UIPushBehaviorMode)mode Block:(void(^)(UIPushBehavior* push))block;

- (void)DynamicItemBehaviorToDynamicBehavior:(UIDynamicBehavior*)dynamicBehavior items:(NSArray*)items Block:(void(^)(UIDynamicItemBehavior* dynamicItemBehavior))block;



@end
