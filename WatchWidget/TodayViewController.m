//
//  TodayViewController.m
//  WatchWidget
//
//  Created by Pranay on 09/04/15.
//  Copyright (c) 2015 mobitronics. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#define NAME_KEY @"KName_Key"

@interface TodayViewController () <NCWidgetProviding>

@property (weak, nonatomic) IBOutlet UILabel *watchLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation TodayViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  [NSTimer scheduledTimerWithTimeInterval:1.0
                                   target:self
                                 selector:@selector(updateWatchLabelText:)
                                 userInfo:nil
                                  repeats:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
  // Perform any setup necessary in order to update the view.
  
  // If an error is encountered, use NCUpdateResultFailed
  // If there's no update required, use NCUpdateResultNoData
  // If there's an update, use NCUpdateResultNewData
  completionHandler(NCUpdateResultNewData);
}

- (void)updateWatchLabelText:(id)sender {
  
  //update watch system
  NSDate *today = [NSDate date];
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
  NSString *currentTime = [dateFormatter stringFromDate:today];
  [self.watchLabel setText:currentTime];
  
  //get the shared name
  NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.goldengekko.NicotinellWidgetDemo"];
  [self.nameLabel setText:[sharedDefaults valueForKey:NAME_KEY]];
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
  return UIEdgeInsetsZero;
}

@end
