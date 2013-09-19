//
//  OZViewController.m
//  DemoUIKitDynamicApp2
//
//  Created by Chalermchon Samana on 9/19/13.
//  Copyright (c) 2013 Onzondev Innovation Co., Ltd. All rights reserved.
//

#import "OZViewController.h"

@interface OZViewController ()<UICollisionBehaviorDelegate>{
    
    IBOutlet UIView *faceView1;
    
    UIDynamicAnimator *animator;
    UIPushBehavior *pushBhv;
    UIGravityBehavior *gravBhv;
    UIAttachmentBehavior *attBhv;
    UICollisionBehavior *collBhv;
    UISnapBehavior *snpBhv;
}

@end

@implementation OZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //face
    faceView1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"face1"]];
    
    //animator
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //behavior
//    pushBhv = [[UIPushBehavior alloc] initWithItems:@[faceView1] mode:UIPushBehaviorModeInstantaneous];
//    [pushBhv setPushDirection:CGVectorMake(0, 2)];
    
    gravBhv = [[UIGravityBehavior alloc] initWithItems:@[faceView1]];
//    gravBhv.gravityDirection = CGVectorMake(0, 1);//down
    
//    attBhv = [[UIAttachmentBehavior alloc] initWithItem:faceView1
//                                       attachedToAnchor:CGPointMake(350, 300)];
//    attBhv.frequency = 1;
//    attBhv.damping = 0.1;
    
    snpBhv = [[UISnapBehavior alloc] initWithItem:faceView1 snapToPoint:CGPointMake(350, 850)];
    snpBhv.damping = .5;
    
    //collision
    collBhv = [[UICollisionBehavior alloc] initWithItems:@[faceView1]];
    collBhv.collisionDelegate = self;
    //collBhv.collisionMode = UICollisionBehaviorModeBoundaries;
    collBhv.translatesReferenceBoundsIntoBoundary = YES;
    
    [animator addBehavior:snpBhv];
    [animator addBehavior:gravBhv];
//    [animator addBehavior:pushBhv];
//    [animator addBehavior:attBhv];
    [animator addBehavior:collBhv];
    
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    
//    gravBhv.gravityDirection = CGVectorMake(0, p.y>500?-1:1);
    
    pushBhv.pushDirection = CGVectorMake(0,p.y>500? -2:2);
    pushBhv.active = YES;
    
}


- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier{
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
