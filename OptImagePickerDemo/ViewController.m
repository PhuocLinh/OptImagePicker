//
//  ViewController.m
//  OptImagePickerDemo
//
//  Created by LinhLuu on 4/21/16.
//  Copyright © 2016 LinhLuu. All rights reserved.
//

#import "ViewController.h"
#import "OptImagePickerController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectPhotosButtonTap:(id)sender {
    OptImagePickerController *imagePickerController = [OptImagePickerController new];
    imagePickerController.mediaType = OptImagePickerMediaTypeImage;
    imagePickerController.allowsMultipleSelection = NO;
    imagePickerController.showsNumberOfSelectedAssets = YES;
    imagePickerController.maximumNumberOfSelection = 6;
    [self presentViewController:imagePickerController animated:YES completion:NULL];
    
    [imagePickerController setDidCancelBlock:^(OptImagePickerController *imagePickerController) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
    [imagePickerController setDidFinishPickingAssets:^(OptImagePickerController *imagePickerController, NSArray *assets) {
        NSLog(@"Selected assets:");
        NSLog(@"%@", assets);
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
}

@end
