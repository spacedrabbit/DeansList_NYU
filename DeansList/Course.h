//
//  Course.h
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "UniversityDepartments.h"
@class Staff;
@class Student;

@protocol AssistantTeachers <NSObject>

@optional
- (void) addAssistantTeachers: (NSArray *) asstTeachers;
@end


@interface Course : UniversityDepartments <AssistantTeachers>


@property (strong, nonatomic, readonly) NSString * courseName;
@property (strong, nonatomic) Staff * teacher;
@property (strong, nonatomic) NSMutableArray * students;
@property (strong, nonatomic) NSMutableArray * assistantTeachers;

- (NSString *)description;
- (void) changeCourseName: (NSString *) newName;
- (void) addStudentsObject:(Student *) studentName;
- (void) dropStudent: (Student *) studentName;
- (void) changeTeacher: (Staff *) newTeacher;

@end
