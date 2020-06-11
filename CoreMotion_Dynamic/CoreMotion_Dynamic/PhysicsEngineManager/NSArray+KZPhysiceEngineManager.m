//
//  NSArray+KZPhysiceEngineManager.m
//  不规则图形
//
//  Created by KingZ on 15/11/10.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import "NSArray+KZPhysiceEngineManager.h"
#import "KZPEM.h"

@implementation NSArray (PhysiceEngineManager)

- (void)pem_CollisionBehaviorBlock:(void(^)(UICollisionBehavior*))block{

    [[KZPhysicsEngineManager sharedInstance]CollisionBehavior:self Block:block];
    
}

- (void)pem_PushBehaviorMode:(UIPushBehaviorMode)mode Block:(void(^)(UIPushBehavior*))block{
    
    [[KZPhysicsEngineManager sharedInstance]PushBehavior:self mode:mode Block:block];

}

- (void)pem_DynamicItemBehavior:(UIDynamicBehavior*)behavior Block:(void(^)(UIDynamicItemBehavior* itemBehavior))block{

    [[KZPhysicsEngineManager sharedInstance]DynamicItemBehaviorToDynamicBehavior:behavior items:self Block:block];

}

@end
