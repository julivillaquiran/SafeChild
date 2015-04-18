//
//  LoginViewController.h
//  SafeChild
//
//  Created by Julian Villaquiran on 18/04/15.
//  Copyright (c) 2015 Julian Villaquiran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Login.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;

- (IBAction)loginButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *loginButtonOutlet;

@property Login * login;

@end
