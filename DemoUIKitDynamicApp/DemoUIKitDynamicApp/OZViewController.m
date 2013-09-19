//
//  OZViewController.m
//  DemoUIKitDynamicApp
//
//  Created by Chalermchon Samana on 9/19/13.
//  Copyright (c) 2013 Onzondev Innovation Co., Ltd. All rights reserved.
//

#import "OZViewController.h"

@interface OZViewController (){
    
    IBOutlet UIView *ball1;
    IBOutlet UIView *ball2;
    IBOutlet UIView *ball3;
    IBOutlet UIView *ball4;
    IBOutlet UIView *ball5;
    IBOutlet UIView *ball6;
    
    UIDynamicAnimator *animator,*animator2;
    UIPushBehavior *pushBehv;
    UICollisionBehavior *collisionBehv;
}

@end

@implementation OZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, 1024, 768);
    ball2.layer.cornerRadius = 25;
    ball2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"beach_ball_2"]];
    
    ball4.layer.cornerRadius = 25;
    ball6.layer.cornerRadius = 25;
    
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    pushBehv = [[UIPushBehavior alloc] initWithItems:@[ball1,ball2,ball3,ball4,ball5,ball6] mode:UIPushBehaviorModeInstantaneous];
    pushBehv.pushDirection = CGVectorMake(0, 10);

    
    
    collisionBehv = [[UICollisionBehavior alloc] initWithItems:@[ball1,ball2,ball3,ball4,ball5,ball6]];

    [collisionBehv addBoundaryWithIdentifier:@"top"
                                   fromPoint:CGPointMake(0, 0)
                                     toPoint:CGPointMake(self.view.frame.size.width,0)];
    [collisionBehv addBoundaryWithIdentifier:@"right"
                                   fromPoint:CGPointMake(0,0)
                                     toPoint:CGPointMake(0,self.view.frame.size.height)];
    [collisionBehv addBoundaryWithIdentifier:@"left"
                                   fromPoint:CGPointMake(self.view.frame.size.width,0)
                                     toPoint:CGPointMake(self.view.frame.size.width,self.view.frame.size.height)];
    [collisionBehv addBoundaryWithIdentifier:@"bottom"
                                   fromPoint:CGPointMake(0, self.view.frame.size.height)
                                     toPoint:CGPointMake(self.view.frame.size.width,self.view.frame.size.height)];
    collisionBehv.collisionDelegate = self;
    
    [animator addBehavior:pushBehv];
    [animator addBehavior:collisionBehv];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    
    NSString *boundaryIdentifier = (NSString*)identifier;
    
    if ([boundaryIdentifier isEqualToString:@"top"]) {
        pushBehv.pushDirection = CGVectorMake(arc4random()%5+1, -pushBehv.pushDirection.dy);
        pushBehv.active = YES;
        
        //NSLog(@"wall");
    }else if ([boundaryIdentifier isEqualToString:@"left"]) {
        pushBehv.pushDirection = CGVectorMake(-pushBehv.pushDirection.dy, arc4random()%5+1);
        pushBehv.active = YES;
        
        //NSLog(@"wall");
    }else if ([boundaryIdentifier isEqualToString:@"right"]) {
        pushBehv.pushDirection = CGVectorMake(-pushBehv.pushDirection.dy, arc4random()%5+1);
        pushBehv.active = YES;
        
        //NSLog(@"wall");
    }else if ([boundaryIdentifier isEqualToString:@"bottom"]) {
        pushBehv.pushDirection = CGVectorMake(arc4random()%5+1, -pushBehv.pushDirection.dy);
        pushBehv.active = YES;
        
        //NSLog(@"wall");
    }
    
}

@end
