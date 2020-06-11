//
//  UIView+KZPhysicsEngineManager.m
//  不规则图形
//
//  Created by KingZ on 15/11/10.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import "UIView+KZPhysicsEngineManager.h"
#import "KZPEM.h"

@implementation UIView (KZPhysicsEngineManager)

- (void)pem_DynamicAnimator:(void(^)(KZPhysicsEngineManager*))block{
    
    KZPhysicsEngineManager *pem = [KZPhysicsEngineManager sharedInstance];
    [pem DynamicAnimatorWithReferenceView:self];
    block(pem);
}

- (void)pem_CollisionBehaviorBlock:(void(^)(UICollisionBehavior*))block{

    [@[self] pem_CollisionBehaviorBlock:block];
    
}

- (void)pem_PushBehaviorMode:(UIPushBehaviorMode)mode Block:(void(^)(UIPushBehavior*))bloc{
    
    [@[self] pem_PushBehaviorMode:mode Block:bloc];
}

- (void)pem_DynamicItemBehavior:(UIDynamicBehavior*)behavior Block:(void(^)(UIDynamicItemBehavior* itemBehavior))block{

    [@[self] pem_DynamicItemBehavior:behavior Block:block];
}


@end
