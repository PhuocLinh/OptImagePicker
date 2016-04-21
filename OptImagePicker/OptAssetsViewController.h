//
//  OptAssetsViewController.h
//  OptImagePicker
//
//  Created by LinhLuu on 4/21/16.
//  Copyright © 2016 LinhLuu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OptImagePickerController;
@class PHAssetCollection;

@interface OptAssetsViewController : UIViewController

@property (nonatomic, weak) OptImagePickerController *imagePickerController;
@property (nonatomic, strong) PHAssetCollection *assetCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
