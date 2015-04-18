//
//  DenunciarViewController.m
//  SafeChild
//
//  Created by Julian Villaquiran on 18/04/15.
//  Copyright (c) 2015 Julian Villaquiran. All rights reserved.
//

#import "DenunciarViewController.h"

@interface DenunciarViewController ()

@end

@implementation DenunciarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertView * erroCamara = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Tu dispositivo no tiene camara, solo podras usar imagenes desde tu fototeca" delegate:nil cancelButtonTitle:@"Aceptar" otherButtonTitles: nil];
        [erroCamara show];
    }
    
    //localizacion
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    [_locationManager requestAlwaysAuthorization];
    [_locationManager startUpdatingLocation];
    
    
    
    _locationOutput.text = [NSString stringWithFormat:@"Tu locacion acá"];
    //_locationOutput.text = [NSString stringWithFormat:@"%.8f , %.8f", ];
}

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
            // If the event is recent, do something with it.
    NSString *dateString = [NSDateFormatter localizedStringFromDate: eventDate
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterFullStyle];
    NSLog(@"%@",dateString);
    _locationOutput.text = [NSString stringWithFormat:@"%.4f , %.4f", location.coordinate.latitude, location.coordinate.longitude];
    [_locationManager stopUpdatingLocation];
    NSDictionary *infoDenuncia = @{@"ubicacion" : _locationOutput.text, @"photo":@"/url/photo", @"detalles" : @"Descripciòn"};
    NSLog(@"%@", infoDenuncia);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)loadImage:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    _imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    _camaraButton.hidden = YES;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)enviar:(id)sender{
    NSString *emailTitle = @"Denuncia de explotación infantil";
    NSString *messageBody = @"Se ha generado una denuncia <br/> Ubicación: ";
    NSArray *toRecipients = [NSArray arrayWithObjects:@"arango1988@gmail.com", nil];
    MFMailComposeViewController *mc =[[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate =self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipients];
    [self presentViewController:mc animated:YES completion:NULL];
}
-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch (result)
    {
    case MFMailComposeResultCancelled:
        NSLog(@"Mail Cancelled");
        break;
    case MFMailComposeResultSaved:
        NSLog(@"Mail Saved");
        break;
    case MFMailComposeResultSent:
        NSLog(@"Mail Sent");
        break;
    case MFMailComposeResultFailed:
        NSLog(@"Mail Failed :(");
        break;
       default: break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL]; }

@end
