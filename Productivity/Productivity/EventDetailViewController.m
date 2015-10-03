//
//  EventDetailViewController.m
//  Productivity
//
//  Created by Shannon Phu on 10/3/15.
//  Copyright (c) 2015 Shannon Phu. All rights reserved.
//

#import "EventDetailViewController.h"

double secondsInAnHour = 3600;

@implementation EventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.task.title;
    
    self.descriptionLabel.text = self.task.taskDescription;
    
    NSDate *deadline = self.task.deadline;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM dd, yyyy"];
    NSString *deadlineString = [dateFormatter stringFromDate:deadline];
    self.deadlineLabel.text = deadlineString;
    
    self.locationLabel.text = self.task.location;
    
    NSTimeInterval timeUntilDeadline = [deadline timeIntervalSinceDate:[NSDate date]]; // returns seconds
    int hoursBetweenDates = timeUntilDeadline / secondsInAnHour;
    self.timeRemainingLabel.text = [NSString stringWithFormat:@"Hours Left: %d", hoursBetweenDates];
    
    self.progressLabel.text = [NSString stringWithFormat:@"Progress: %d", [self.task.progress intValue] * 100];
    
    self.pointsLabel.text = [NSString stringWithFormat:@"You will get %d extra points if completed %d days early.", 5, 2];
}

@end
