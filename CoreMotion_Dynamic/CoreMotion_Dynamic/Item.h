//
//  Item.h
//  CoreMotion_Dynamic
//
//  Created by KingZ on 15/11/11.
//  Copyright (c) 2015年 KingZ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^touchBeginEvent)(CGPoint startPoint);

typedef void(^touchMoveEvent)(CGPoint movePoint);

typedef void(^touchEndEvent)(CGPoint endPoint);

@interface Item : UIImageView{
    
    touchBeginEvent _beginBlock;
    
    touchMoveEvent _moveBlock;
    
    touchEndEvent _endBlock;

}

@end
