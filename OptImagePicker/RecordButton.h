//
//  RecordButton.h
//  SMEMedia
//
//  Created by LinhLuu on 4/22/16.
//  Copyright © 2016 LinhLuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordButton : UIButton

@property (nonatomic, strong) IBInspectable UIColor *buttonColor;
@property (nonatomic, strong) IBInspectable UIColor *progressColor;
@property (nonatomic, strong) CALayer *circleLayer;
@property (nonatomic, strong) CALayer *circleBorder;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAGradientLayer *gradientMaskLayer;

- (void)setProgress:(CGFloat)newProgress;
- (void)setButtonImage:(UIImage*)image;

@end