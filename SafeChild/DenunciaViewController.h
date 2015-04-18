//
//  DenunciaViewController.h
//  SafeChild
//
//  Created by Julian Villaquiran on 17/04/15.
//  Copyright (c) 2015 Julian Villaquiran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DenunciaViewController : UIViewController <CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)loadImage:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *locationOutput;
- (IBAction)enviar:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loadImageSelf;

@end
