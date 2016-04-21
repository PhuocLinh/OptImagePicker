//
//  OptAssetCell.m
//  OptImagePicker
//
//  Created by LinhLuu on 4/21/16.
//  Copyright © 2016 LinhLuu. All rights reserved.
//

#import "OptAssetCell.h"

@interface OptAssetCell ()

@property (weak, nonatomic) IBOutlet UIView *overlayView;

@end

@implementation OptAssetCell

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    // Show/hide overlay view
    self.overlayView.hidden = !(selected && self.showsOverlayViewWhenSelected);
}

@end
