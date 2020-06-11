//
//  ViewController.m
//  不规则图形
//
//  Created by KingZ on 15/11/5.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import "ViewController.h"
#import "KzCoreMotionManager.h"

#import "KZPEM.h"


@interface ViewController (){

    
    
    
}



@property(nonatomic,copy)NSMutableArray* images;

@property(nonatomic,copy)KZPhysicsEngineManager* pem;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _images = [[NSMutableArray alloc]init];
    
    KzCoreMotionManager* coreM = [KzCoreMotionManager sharedInstance];
    
    
    [self.view pem_DynamicAnimator:^(KZPhysicsEngineManager *pem) {
        _pem = pem;
        [pem CollisionBehavior:nil Block:^(UICollisionBehavior *collision) {
            
            collision.translatesReferenceBoundsIntoBoundary = YES;
            collision.collisionMode = UICollisionBehaviorModeEverything;
        }];
        
    }];

    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    
    [self.view addGestureRecognizer:tap];

//    
    [coreM getDeviceMotionWithBlock:^(double x, double y, double z) {

        if (fabs(x*100)>1&&fabs(y*100)>1) {
            
            for (UIImageView* imagev in _images) {
                
                [imagev pem_PushBehaviorMode:UIPushBehaviorModeInstantaneous Block:^(UIPushBehavior *push) {
                   
                    [push setAngle:atan2l(-y*100, x*100) magnitude:sqrtf(pow(x, 2)+pow(y, 2))];
                    
                }];
                
            }
        }
        
    }];
    
}



- (void)tapped:(UITapGestureRecognizer *)gesture {

    NSUInteger num = arc4random() % 8 + 1;
    NSString *filename = [NSString stringWithFormat:@"00%ld", (unsigned long)num];
    UIImage *image = [UIImage imageNamed:filename];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    imageView.userInteractionEnabled = YES;
    [imageView setFrame:CGRectMake(0, 0, 60, 60)];
    [_images addObject:imageView];
    
    imageView.transform = CGAffineTransformMakeScale(.5, .5);
    
    [UIView animateWithDuration:.3 animations:^{
        imageView.transform = CGAffineTransformIdentity;
    }];
    
    [self.view addSubview:imageView];
    
    CGPoint tappedPos = [gesture locationInView:gesture.view];
    imageView.center = tappedPos;
    
    
    
    
    [imageView pem_CollisionBehaviorBlock:^(UICollisionBehavior *collision) {
//        collision addBoundaryWithIdentifier:imageView forPath:<#(nonnull UIBezierPath *)#>
        
    }];
    
//    [imageView pem_DynamicItemBehavior:nil Block:^(UIDynamicItemBehavior *itemBehavior) {
//       
//        itemBehavior.elasticity = 0.8;
//        itemBehavior.friction = num/10.0;
//        itemBehavior.resistance = 0.3;
//    }];
    


}

//- (void)imageViewTap:(UILongPressGestureRecognizer*)tap{
//    
//    CGPoint point = [tap locationInView:self.view];
//    
//    if (tap.state == UIGestureRecognizerStateBegan) {
//        [_images removeObject:tap.view];
//    }
//    tap.view.center = point;
//    if (tap.state ==UIGestureRecognizerStateEnded) {
//        [_images addObject:tap.view];
//    }
//
//    
//}

- (void)imageViewPan:(UIPanGestureRecognizer*)pan{
    
    CGPoint startPoint = [pan locationInView:self.view];
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        CGPoint endPoint = [pan translationInView:self.view];
        
    }
    
//    [pan.view pem_PushBehaviorMode:UIPushBehaviorModeInstantaneous Block:^(UIPushBehavior *push) {
//        
//        
//        
//    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
