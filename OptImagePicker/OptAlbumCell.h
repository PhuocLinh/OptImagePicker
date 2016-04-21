//
//  OptAlbumCell.h
//  OptImagePicker
//
//  Created by LinhLuu on 4/21/16.
//  Copyright © 2016 LinhLuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptAlbumCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (nonatomic, assign) CGFloat borderWidth;

@end
