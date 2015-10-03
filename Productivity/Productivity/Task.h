//
//  Task.h
//  Productivity
//
//  Created by Shannon Phu on 10/3/15.
//  Copyright (c) 2015 Shannon Phu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Task : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * taskDescription;
@property (nonatomic, retain) NSDate * deadline;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSNumber * timeRemaining;
@property (nonatomic, retain) NSNumber * progress;
@property (nonatomic, retain) NSNumber * points;

@end
