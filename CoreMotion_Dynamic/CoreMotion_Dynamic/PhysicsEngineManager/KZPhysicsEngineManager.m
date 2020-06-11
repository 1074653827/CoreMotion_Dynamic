//
//  KZPhysicsEngineManager.m
//  不规则图形
//
//  Created by KingZ on 15/11/10.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import "KZPhysicsEngineManager.h"
#import "KZPEM.h"

@interface KZPhysicsEngineManager()
{
    UIView* _referenceView;
    
}

@property(nonatomic)UIDynamicAnimator* animator;

@property(nonatomic)UICollisionBehavior* collisionBehavior;

@property(nonatomic)UIPushBehavior* pushBehavior;


@end

@implementation KZPhysicsEngineManager

+ (instancetype)sharedInstance{
    static KZPhysicsEngineManager* this = nil;
    
    if (!this) {
        this = [[KZPhysicsEngineManager alloc]init];
    }
    
    return this;
    
}


//
//-(instancetype)initWithReferenceView:(UIView*)view{
//    if (self == [super init])
//    {
//        _referenceView = view;
//        [self createUpKZPhysicsEngineManager];
//        
//    }
//    
//    return self;
//}

- (void)DynamicAnimatorWithReferenceView:(UIView*)referenceView{
    if (!self.animator) {

        self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:referenceView];
    }

}

- (void)CollisionBehavior:(NSArray *)items Block:(void(^)(UICollisionBehavior* collision))block{

    if (!self.collisionBehavior) {
        self.collisionBehavior = [[UICollisionBehavior alloc]initWithItems:items];
    }
    else{
        for (id item in items) {
            if (![items conformsToProtocol:@protocol(UIDynamicItem)]) {
                
                [self.collisionBehavior addItem:item];
            }
        }
    }

    if (self.animator) {
        
        [self.animator addBehavior:self.collisionBehavior];
    }
    else{
    
        NSLog(@"no addDynamicAnimator");

    }
    block(self.collisionBehavior);
}

- (void)PushBehavior:(NSArray*)items mode:(UIPushBehaviorMode)mode Block:(void(^)(UIPushBehavior* push))block{
    
    if (mode == UIPushBehaviorModeInstantaneous) {
        self.pushBehavior = [[UIPushBehavior alloc]initWithItems:items mode:mode];
        
    }
    
    else{
        for (id item in items) {
            if (![items conformsToProtocol:@protocol(UIDynamicItem)]) {
                
                [self.pushBehavior addItem:item];
            }
        }
    }
    if (self.animator) {
        
        [self.animator addBehavior:self.pushBehavior];
    }
    else{
        
        NSLog(@"no addDynamicAnimator");
        
    }
    block(self.pushBehavior);
    
    
}

- (void)DynamicItemBehaviorToDynamicBehavior:(UIDynamicBehavior*)dynamicBehavior items:(NSArray*)items Block:(void(^)(UIDynamicItemBehavior* dynamicItemBehavior))block{
    UIDynamicItemBehavior* dynamicItemBehavior = [[UIDynamicItemBehavior alloc]initWithItems:nil];

    for (id item in items) {
        if (![items conformsToProtocol:@protocol(UIDynamicItem)]) {
            
            [dynamicItemBehavior addItem:item];
        }
    }
    if (dynamicBehavior) {
        
        [dynamicBehavior addChildBehavior:dynamicItemBehavior];
    }else if(self.animator){
    
        [self.animator addBehavior:dynamicItemBehavior];
    }else{
        
        NSLog(@"no addDynamicAnimator");
    }
    block(dynamicItemBehavior);
    
}





@end
