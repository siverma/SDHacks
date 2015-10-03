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
#import <CoreData/CoreData.h>

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

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)save:(id)sender {
    NSLog(@"saved");
    
    NSManagedObjectContext *context = [self managedObjectContext];
    Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task"
                                      inManagedObjectContext:context];
    
//    NSManagedObject *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:self.managedObjectContext];
    
//    [task setValue:self.taskTextField.text forKey:@"title"];
//    [task setValue:self.detailsTextField.text forKey:@"taskDescription"];
//    [task setValue:self.locationTextField.text forKey:@"location"];
//    [task setValue:[NSNumber numberWithInt:0] forKey:@"progress"];
//    [task setValue:[NSNumber numberWithInt:10] forKey:@"points"];
    

    task.title = self.taskTextField.text;
    task.location = self.locationTextField.text;
    task.taskDescription = self.detailsTextField.text;
    task.progress = [NSNumber numberWithInt:0];
    task.points = [NSNumber numberWithInt:10];
    NSDate *date = self.datePicker.date;
    task.deadline = date;
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
        return;
    }
    
    self.task = task;
    
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
