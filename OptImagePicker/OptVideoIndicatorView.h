//
//  OptVideoIndicatorView.h
//  OptImagePicker
//
//  Created by LinhLuu on 4/21/16.
//  Copyright © 2016 LinhLuu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OptVideoIconView.h"
#import "OptSlomoIconView.h"

@interface OptVideoIndicatorView : UIView

@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet OptVideoIconView *videoIcon;
@property (nonatomic, weak) IBOutlet OptSlomoIconView *slomoIcon;

@end
