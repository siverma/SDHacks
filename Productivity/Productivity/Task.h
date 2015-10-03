//
//  Task.h
//  Productivity
//
//  Created by Shannon Phu on 10/3/15.
//  Copyright (c) 2015 Shannon Phu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDate *deadline;
@property (strong, nonatomic) NSString *taskDescription;
@property (strong, nonatomic) NSString *location;
@property (nonatomic) int pointsWorth;
@property (nonatomic) float percentCompleted;

@end
