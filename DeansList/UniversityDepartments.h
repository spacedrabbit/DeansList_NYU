//
//  UniversityDepartments.h
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "University.h"

@interface UniversityDepartments : University

@property (strong, nonatomic, setter = verifyCourse:) NSString * departmentName;
@property (strong, nonatomic) NSString * departmentHead;
@property (strong, nonatomic) NSMutableArray * courses;

- (void) addCoursesObject:(University *) newCourse;

@end
