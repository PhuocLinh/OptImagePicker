//
//  RecordButton.m
//  SMEMedia
//
//  Created by LinhLuu on 4/22/16.
//  Copyright © 2016 LinhLuu. All rights reserved.
//

#import "RecordButton.h"

@interface RecordButton(){
    UIColor *mainColor;
    UIColor *progColor;
    CGFloat currentProgress;
    UIImage *buttonImage;
}
@end

@implementation RecordButton

- (id)initWithFrame:(CGRect)aRect {
    self = [super initWithFrame:aRect];
    
    if (self) {
        [self addTarget:self action:@selector(didTouchDown) forControlEvents:UIControlEventTouchUpInside];
        [self drawButton];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    if (self) {
        [self addTarget:self action:@selector(didTouchDown) forControlEvents:UIControlEventTouchUpInside];
        [self drawButton];
    }
    
    return self;
}

- (void)setProgressColor:(UIColor *)prColor {
    
    progColor = prColor;
    
    UIColor *topColor = progColor;
    UIColor *bottomColor = progColor;
    _gradientMaskLayer.colors = @[(id)topColor.CGColor, (id)bottomColor.CGColor];
    
}

- (void)setButtonColor:(UIColor *)buttonColor{
    
    _circleLayer.backgroundColor = [UIColor clearColor].CGColor;
    _circleBorder.borderColor = buttonColor.CGColor;
    
    mainColor = buttonColor;
}

- (void)drawButton {
    
    currentProgress = 0;
    self.backgroundColor = [UIColor clearColor];
    
    // Get the root layer
    CALayer *layer = self.layer;
    
    if (!_circleLayer) {
        
        _circleLayer = [CALayer layer];
        _circleLayer.backgroundColor = [UIColor clearColor].CGColor;
        
        CGFloat size = self.frame.size.width/1.8;
        _circleLayer.bounds = CGRectMake(0, 0, size, size);
        _circleLayer.anchorPoint = CGPointMake(0.5, 0.5);
        _circleLayer.position = (CGPoint){CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)};
        _circleLayer.contents = (__bridge id)buttonImage.CGImage;
        _circleLayer.cornerRadius = size/2;
        
        [layer insertSublayer:_circleLayer atIndex:0];
    }
    
    if (!_circleBorder) {
        
        _circleBorder = [CALayer layer];
        _circleBorder.backgroundColor = [UIColor clearColor].CGColor;
        _circleBorder.borderWidth = 1;
        _circleBorder.borderColor = mainColor.CGColor;
        
        _circleBorder.bounds = CGRectMake(0, 0, self.bounds.size.width-1.5f, self.bounds.size.height-1.5f);
        _circleBorder.anchorPoint = CGPointMake(0.5, 0.5);
        _circleBorder.position = (CGPoint){CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)};
        
        _circleBorder.cornerRadius = self.frame.size.width/2;
        
        [layer insertSublayer:_circleBorder atIndex:0];
    }
    
    if (!_progressLayer) {
        
        CGFloat startAngle = M_PI + M_PI_2;
        CGFloat endAngle = M_PI * 3 + M_PI_2;
        CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        
        _gradientMaskLayer = [self gradientMask];
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.path = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:self.frame.size.width/2-2 startAngle:startAngle endAngle:endAngle clockwise:YES].CGPath;
        _progressLayer.backgroundColor = [UIColor clearColor].CGColor;
        _progressLayer.fillColor = nil;
        _progressLayer.strokeColor = [UIColor blackColor].CGColor;
        _progressLayer.lineWidth = 4.0;
        _progressLayer.strokeStart = 0.0;
        _progressLayer.strokeEnd = 0.0;
        
        _gradientMaskLayer.mask = _progressLayer;
        [layer insertSublayer:_gradientMaskLayer atIndex:0];
    }
}

- (CAGradientLayer *)gradientMask {
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.locations = @[@0.0, @1.0];
    
    if (!progColor)
        progColor = [UIColor blueColor];
    
    UIColor *topColor = progColor;
    UIColor *bottomColor = progColor;
    
    gradientLayer.colors = @[(id)topColor.CGColor, (id)bottomColor.CGColor];
    
    return gradientLayer;
}


- (void)layoutSubviews {
    
    _circleLayer.anchorPoint = CGPointMake(0.5, 0.5);
    _circleLayer.position = (CGPoint){CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)};
    
    _circleBorder.anchorPoint = CGPointMake(0.5, 0.5);
    _circleBorder.position = (CGPoint){CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds)};
    
    [super layoutSubviews];
}

- (void)didTouchDown {
    
    CGFloat duration = 0.15;
    
    // Animate border
    CABasicAnimation *borderColor = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    borderColor.duration = duration;
    borderColor.fillMode = kCAFillModeForwards;
    borderColor.removedOnCompletion = NO;
    borderColor.toValue = (id)[UIColor colorWithRed:0.83 green:0.86 blue:0.89 alpha:1].CGColor;
    CABasicAnimation *borderScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    borderScale.fromValue = [NSNumber numberWithFloat:[[_circleBorder.presentationLayer valueForKeyPath: @"transform.scale"] floatValue]];
    borderScale.toValue = @0.88;
    [borderScale setDuration:duration];
    borderScale.fillMode = kCAFillModeForwards;
    borderScale.removedOnCompletion = NO;
    
    CAAnimationGroup *borderAnimations = [CAAnimationGroup animation];
    borderAnimations.removedOnCompletion = NO;
    borderAnimations.fillMode = kCAFillModeForwards;
    [borderAnimations setDuration:duration];
    [borderAnimations setAnimations:@[borderColor, borderScale]];
    
    // Animate progress
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeIn.fromValue = @0.0;
    fadeIn.toValue = @1.0;
    fadeIn.duration = duration;
    fadeIn.fillMode = kCAFillModeForwards;
    fadeIn.removedOnCompletion = NO;
    
    [_progressLayer addAnimation:fadeIn forKey:@"fadeIn"];
    [_circleBorder addAnimation:borderAnimations forKey:@"borderAnimations"];
}


- (void)didTouchUp {
    
    CGFloat duration = 0.15;
    
    CABasicAnimation *borderColor = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    borderColor.duration = duration;
    borderColor.fillMode = kCAFillModeForwards;
    borderColor.removedOnCompletion = NO;
    borderColor.toValue = (id)mainColor.CGColor;
    CABasicAnimation *borderScale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    borderScale.fromValue = @0.88;
    borderScale.toValue = @1.0;
    [borderScale setDuration:duration];
    borderScale.fillMode = kCAFillModeForwards;
    borderScale.removedOnCompletion = NO;
    
    CAAnimationGroup *borderAnimations = [CAAnimationGroup animation];
    borderAnimations.removedOnCompletion = NO;
    borderAnimations.fillMode = kCAFillModeForwards;
    [borderAnimations setDuration:duration];
    [borderAnimations setAnimations:@[borderColor, borderScale]];
    
    
    // Animate progress
    CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeOut.fromValue = @1.0;
    fadeOut.toValue = @0.0;
    fadeOut.duration = duration*2;
    fadeOut.fillMode = kCAFillModeForwards;
    fadeOut.removedOnCompletion = NO;
    
    [_progressLayer addAnimation:fadeOut forKey:@"fadeOut"];
    [_circleBorder addAnimation:borderAnimations forKey:@"borderAnimations"];
}

- (void)setProgress:(CGFloat)newProgress{
    _progressLayer.strokeEnd = newProgress;
}

- (void)setButtonImage:(UIImage*)image {
    _circleLayer.contents = (__bridge id)image.CGImage;
    buttonImage = image;
}

@end