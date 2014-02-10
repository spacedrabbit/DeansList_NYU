//
//  University.h
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface University : NSObject

@property (nonatomic, readonly) NSString * universityName;
@property (nonatomic, readonly) NSString * universityLocation;
@property (strong, nonatomic) NSMutableArray * departments;
@property (strong, nonatomic) NSMutableArray * enrolledStudents;
@property (strong, nonatomic) NSMutableArray * hiredStaff;

+ (NSArray *) getDepartments;
- (void) addDepartment: (University *) newDepartment;
- (void) enrollStudent: (NSArray *) student;
- (void) hireStaff: (NSArray *) staff;
- (void) addCourseID: (University *) courseID withName: (NSString *) courseName;
-(NSDictionary *) getCourseCatalog;
@end
