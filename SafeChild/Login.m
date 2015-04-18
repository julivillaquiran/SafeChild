//
//  Login.m
//  SafeChild
//
//  Created by Julian Villaquiran on 17/04/15.
//  Copyright (c) 2015 Julian Villaquiran. All rights reserved.
//

#import "Login.h"

@implementation Login


-(void)saveUser{
    
    [[NSUserDefaults standardUserDefaults] setObject:_userName forKey:@"UserName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
