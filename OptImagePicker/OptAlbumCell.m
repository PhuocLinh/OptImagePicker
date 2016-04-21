//
//  OptAlbumCell.m
//  OptImagePicker
//
//  Created by LinhLuu on 4/21/16.
//  Copyright © 2016 LinhLuu. All rights reserved.
//

#import "OptAlbumCell.h"

@implementation OptAlbumCell

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    
    self.imageView1.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.imageView1.layer.borderWidth = borderWidth;
    
    self.imageView2.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.imageView2.layer.borderWidth = borderWidth;
    
    self.imageView3.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.imageView3.layer.borderWidth = borderWidth;
}

@end
