//
//  ViewController.m
//  TodayExtensionDemo
//
//  Created by Pranay on 09/04/15.
//  Copyright (c) 2015 mobitronics. All rights reserved.
//

#import "ViewController.h"

// Macro for NSUserDefaults key
#define NAME_KEY @"KName_Key"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)updateButtonAction:(id)sender {
  
  //Update the Value in USer Default
  NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.goldengekko.NicotinellWidgetDemo"];
  [sharedDefaults setValue:self.nameTextField.text forKey:NAME_KEY];
  [sharedDefaults synchronize];
  
  //Clear text field
  self.nameTextField.text = @"";
  
  //Show Alert
  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Done!" message:@"Please check the Notification Center" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
  [alertView show];
}

@end
