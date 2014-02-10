//
//  Staff.h
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "Person.h"
@class Course;

@interface Staff : Person

@property (strong, nonatomic) NSMutableArray * coursesTaught;

- (void) assignToCourse: (Course *) courseName;
- (NSArray *) showCoursesTaught;

@end
