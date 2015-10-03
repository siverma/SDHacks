//
//  NewEventViewController.m
//  Productivity
//
//  Created by Shannon Phu on 10/3/15.
//  Copyright (c) 2015 Shannon Phu. All rights reserved.
//

#import "NewEventViewController.h"
#import "Task.h"
#import "EventDetailViewController.h"

@interface NewEventViewController ()
@property (strong, nonatomic) Task *task;
@property (weak, nonatomic) IBOutlet UITextField *taskTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextField;
@end

@implementation NewEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (Task *)task {
    if (!_task) {
        _task = [[Task alloc] init];
    }
    return _task;
}

- (IBAction)save:(id)sender {
    NSLog(@"saved");

    self.task.title = self.taskTextField.text;
    self.task.location = self.locationTextField.text;
    self.task.taskDescription = self.detailsTextField.text;
    self.task.percentCompleted = 0;
    self.task.pointsWorth = 10;
    NSDate *date = self.datePicker.date;
    self.task.deadline = date;
    
    [self performSegueWithIdentifier:@"showTask" sender:self];
}

- (IBAction)cancel:(id)sender {
    NSLog(@"cancel");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showTask"]) {
        EventDetailViewController *eventVC = segue.destinationViewController;
        eventVC.task = self.task;
    }
}

@end
