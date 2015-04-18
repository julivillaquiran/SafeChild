//
//  DenunciarViewController.h
//  SafeChild
//
//  Created by Julian Villaquiran on 18/04/15.
//  Copyright (c) 2015 Julian Villaquiran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DenunciarViewController : UIViewController <CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *camaraButton;

- (IBAction)loadImage:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *locationOutput;
- (IBAction)enviar:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *observation;

@property CLLocationManager * locationManager;

@end
