//
//  DeansViewViewController.h
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//
/*
 Week 1 Assignment - NYU iOS Intensive
 
                    School
 ----------------------------------------------------------
 - can have multiple Courses
    + found in the UniversityDepartments subclass
 - can have multiple Professors
    + NSMutableArray * hiredStaff in University Class
 - can have multiple Students
    + NSMutableArray * enrolledStudents in University Class
 - has school information (name, etc.)
    + University object has name,location properties
 - print all courses (school)
    + description: overwritten in UniversityDepartments
 - print all professors (school)
    + call nyu.hiredStaff
 - print all students (school)
    + call nyu.enrolledStudents
 - print selected professor and their courses taught  (professor)
    + print pPark.coursesTaught
 - print selected student and their courses enrolled  (student)
    + student.associatedCourses contains this value
 - print selected course with their students and professor (course)
    + print courseName.teacher, and courseName.students
 
                   Course
 ----------------------------------------------------------
 - can have one Professor
    + single Staff object
 - can have multiple Students
    + NSMutableArray of Student objects
 - has course information (name, etc.
    + @property NSString * courseName
 
 
                    Student
 ----------------------------------------------------------
 - can be enrolled in multiple Courses
    + student.associatedCourses has this value
 - has student information (first name, last name, etc.)
    + has name, (NSDate) dateOfBirth, SSN
 
                    Professor
 ----------------------------------------------------------
 - can teach multiple Courses
    + print courseName.teacher
 - has professor information (first name, last name, etc)
    + has name, (NSDate) dateOfBirth, SSN
 
 */
#import <UIKit/UIKit.h>
#import "StudentsView.h"

@interface DeansViewViewController : UIViewController <StudentViewControllerDelegate>
@end
