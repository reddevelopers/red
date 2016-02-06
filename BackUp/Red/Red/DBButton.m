//
//  DBButton.m
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "DBButton.h"
#import <pop/POP.h>

@implementation DBButton

-(void)awakeFromNib{
    
    [self addTarget:self action:@selector(scaleToSmall)
   forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(bounce)
   forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchDragExit | UIControlEventTouchDragOutside];
    
    self.adjustsImageWhenHighlighted = NO;
}


-(void)setCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.cornerRadius = cornerRadius;
    
}

- (void)scaleToSmall{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.95f, 0.95f)];
    //scaleAnimation.duration = 0.1;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSmallAnimation"];
}

- (void)bounce{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 10.0f;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
}


@end
