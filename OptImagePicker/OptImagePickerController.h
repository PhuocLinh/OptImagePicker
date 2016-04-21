//
//  OptImagePickerController.h
//  OptImagePicker
//
//  Created by LinhLuu on 4/21/16.
//  Copyright © 2016 LinhLuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@class OptImagePickerController;

@protocol OptImagePickerControllerDelegate <NSObject>

@optional

- (BOOL)Opt_imagePickerController:(OptImagePickerController *)imagePickerController shouldSelectAsset:(PHAsset *)asset;
- (void)Opt_imagePickerController:(OptImagePickerController *)imagePickerController didSelectAsset:(PHAsset *)asset;
- (void)Opt_imagePickerController:(OptImagePickerController *)imagePickerController didDeselectAsset:(PHAsset *)asset;

@end

typedef NS_ENUM(NSUInteger, OptImagePickerMediaType) {
    OptImagePickerMediaTypeAny = 0,
    OptImagePickerMediaTypeImage,
    OptImagePickerMediaTypeVideo
};

@interface OptImagePickerController : UIViewController

@property (nonatomic, weak) id<OptImagePickerControllerDelegate> delegate;

@property (nonatomic, strong, readonly) NSMutableOrderedSet *selectedAssets;

@property (nonatomic, copy) NSArray *assetCollectionSubtypes;
@property (nonatomic, assign) OptImagePickerMediaType mediaType;

@property (nonatomic, assign) BOOL allowsMultipleSelection;
@property (nonatomic, assign) NSUInteger minimumNumberOfSelection;
@property (nonatomic, assign) NSUInteger maximumNumberOfSelection;

@property (nonatomic, copy) NSString *prompt;
@property (nonatomic, assign) BOOL showsNumberOfSelectedAssets;

@property (nonatomic, assign) NSUInteger numberOfColumnsInPortrait;
@property (nonatomic, assign) NSUInteger numberOfColumnsInLandscape;

@property (nonatomic, strong) UINavigationController *albumsNavigationController;

@property (nonatomic, copy) void (^didCancelBlock)(OptImagePickerController *imagePickerController);
@property (nonatomic, copy) void (^didFinishPickingAssets)(OptImagePickerController *imagePickerController, NSArray *assets);
@end