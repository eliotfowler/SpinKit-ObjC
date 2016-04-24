//
//  RTSpinKitModifiedPlaneAnimation.m
//  SpinKit
//
//  Created by Eliot Fowler on 4/24/16.
//  Copyright © 2016 Ramon Torres. All rights reserved.
//

#import "RTSpinKitModifiedPlaneAnimation.h"
#import "RTSpinKitUtils.h"

@implementation RTSpinKitModifiedPlaneAnimation

-(void)setupSpinKitAnimationInLayer:(CALayer*)layer withSize:(CGSize)size color:(UIColor*)color
{
    CALayer *plane = [CALayer layer];
    plane.frame = CGRectInset(CGRectMake(0.0, 0.0, size.width, size.height), 2.0, 2.0);
    plane.backgroundColor = color.CGColor;
    plane.borderColor = [UIColor blackColor].CGColor;
    plane.borderWidth = 2;
    plane.anchorPoint = CGPointMake(0.5, 0.5);
    plane.anchorPointZ = 0.5;
    plane.shouldRasterize = YES;
    plane.rasterizationScale = [[UIScreen mainScreen] scale];
    [layer addSublayer:plane];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    anim.removedOnCompletion = NO;
    anim.repeatCount = HUGE_VALF;
    anim.duration = 1.2;
    anim.keyTimes = @[@(0.0), @(0.5), @(1.0)];
    
    anim.timingFunctions = @[
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                             ];
    
    anim.values = @[
                    [NSValue valueWithCATransform3D:RTSpinKit3DRotationWithPerspective(1.0/120.0, 0, 0, 0, 0)],
                    [NSValue valueWithCATransform3D:RTSpinKit3DRotationWithPerspective(1.0/120.0, M_PI, 0.0, 1.0,0.0)],
                    [NSValue valueWithCATransform3D:RTSpinKit3DRotationWithPerspective(1.0/120.0, M_PI, 0.0, 0.0,1.0)]
                    ];
    
    [plane addAnimation:anim forKey:@"spinkit-anim"];
}

@end
