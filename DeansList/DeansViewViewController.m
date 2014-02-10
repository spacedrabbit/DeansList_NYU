//
//  DeansViewViewController.m
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "DeansViewViewController.h"
#import "Course.h"
#import "Staff.h"
#import "Student.h"

#define STUDENT 0
#define PROFESSOR 1
#define DEAN 2

@interface DeansViewViewController ()

@property (strong, nonatomic) University * nyu;

@end

@implementation DeansViewViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    /*********************************************
     
        Setting up school, depts, and courses
     
     
     ********************************************/
    
	self.nyu = [[Course alloc] init];
    NSLog(@"%@", self.nyu.universityName);
    
    UniversityDepartments * compSciDept = [UniversityDepartments new];
    compSciDept.departmentName = @"Computer Science Department";
    [self.nyu addDepartment:compSciDept];
    
    UniversityDepartments * bioDept = [UniversityDepartments new];
    bioDept.departmentName = @"Biology Department";
    [self.nyu addDepartment:bioDept];
    
    UniversityDepartments * chemDept = [UniversityDepartments new];
    chemDept.departmentName = @"Chemistry Department";
    [self.nyu addDepartment:chemDept];

#warning would like to create a custom init for Course class
    Course * compSci101 = [Course new];
    [compSci101 changeCourseName: @"Intro to ObjC"];
    [compSciDept addCoursesObject:compSci101];
    
    Course * compSci201 = [Course new];
    [compSci201 changeCourseName:@"Data Structures"];
    [compSciDept addCoursesObject:compSci201];
    
    Course * compSci202 = [Course new];
    [compSci202 changeCourseName:@"Into to Java"];
    [compSciDept addCoursesObject:compSci202];
    
    Course * bio101 = [Course new];
    [bio101 changeCourseName:@"Intro to Biology"];
    [bioDept addCoursesObject:bio101];
    
    Course * chem101 = [Course new];
    [chem101 changeCourseName:@"Molecular Chemistry"];
    [chemDept addCoursesObject:chem101];
    
    /*********************************************
     
     Setting up staff and students
     
     
     ********************************************/
    
    Staff * eWang = [[Staff alloc] initWithName:@"Dr. Eric Wang" SSN:@"999-999-9999" andDOB:NULL];
    Staff * pPark = [[Staff alloc] initWithName:@"Dr. Paul Park" SSN:@"999-999-9999" andDOB:NULL];
    Staff * lTur = [[Staff alloc] initWithName:@"Dr. Louis Tur" SSN:@"999-999-9999" andDOB:NULL];

    
    Student * jNorris = [[Student alloc] initWithName:@"Jim Norris" SSN:@"999-999-9999" andDOB:NULL];
    Student * sKoonin = [[Student alloc] initWithName:@"Shawn Koonin" SSN:@"999-999-9999" andDOB:NULL];
    Student * dDaniel = [[Student alloc] initWithName:@"Devin O' Daniel" SSN:@"999-999-9999" andDOB:NULL];
    Student * dWallace = [[Student alloc] initWithName:@"Dane Wallace" SSN:@"999-999-9999" andDOB:NULL];
    Student * tHoughton = [[Student alloc] initWithName:@"Tempest Houghton" SSN:@"999-999-9999" andDOB:NULL];
    Student * jUnderwood = [[Student alloc] initWithName:@"James Underwood" SSN:@"999-999-9999" andDOB:NULL];
    
    //not yet implemented fully
    jNorris.fullTime = TRUE;
    sKoonin.fullTime = TRUE;
    dDaniel.fullTime = FALSE;
    dWallace.fullTime = TRUE;
    tHoughton.fullTime = FALSE;
    jUnderwood.fullTime = TRUE;
    
    // created this method to make the courses class aware of the
    // student objects
    [self.nyu enrollStudent:@[jNorris, sKoonin, dDaniel, dWallace, tHoughton, jUnderwood]];
#warning theHireStaff method needs to be updated
    [self.nyu hireStaff:@[pPark, eWang, lTur]];
    
    //adding teachers to courses, for simplicity every class in a given department has the same teachin staff
    for (Course * crs in compSciDept.courses) {
        [crs setTeacher:pPark];
        [crs addAssistantTeachers:@[lTur, eWang]];
        [self.nyu addCourseID:crs withName:crs.courseName];
    }
    for (Course * crs in bioDept.courses) {
        [crs setTeacher:lTur];
        [self.nyu addCourseID:crs withName:crs.courseName];
    }
    for (Course * crs in chemDept.courses) {
        [crs setTeacher:eWang];
        [self.nyu addCourseID:crs withName:crs.courseName];
    }

    
    
    /*********************************************
     
     Tests
     
     // add these to test, but updated UI will be able to do this
    //[compSci101 addStudentsObject:jNorris];
    //[compSci101 addStudentsObject:dDaniel];
    //[compSci101 addStudentsObject:sKoonin];
     
    //Basic tests
     //
     //
    NSLog(@"Departments: %@", nyu.departments);
    NSLog(@"Courses for Comp Sci Dept: %@", compSciDept.courses);
    NSLog(@"Professor: %@, Students: %@", compSci101.teacher, compSci101.students);
    NSLog(@"Assistant Teachers: %@", compSci101.assistantTeachers);
    NSLog(@"%@", compSciDept.universityName);
     
    //add/remove students from NYU object and courses object
     //
     //
     
    NSLog(@"Enrolled at NYU: %@", nyu.enrolledStudents);
    NSLog(@"In the Comp Sci Course: %@", compSci101.students);
    [compSci101 dropStudent:jNorris];
    NSLog(@"In the Comp Sci Course after a drop: %@", compSci101.students);
    [compSci101 dropStudent:sKoonin];
    NSLog(@"In the Comp Sci Course after a drop: %@", compSci101.students);
    
    NSLog(@"But, the students are still enrolled at NYU: %@", nyu.enrolledStudents);
    ********************************************/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//used in StudentViewDelegate protocol
-(void)studentViewControllerDidFinish:(StudentsView *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// controls the segue and passes the (enrolled) student objects to the studentViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[segue destinationViewController] setDelegate:self];
    
    if([[segue identifier] isEqualToString:@"toStudentView"]){
        StudentsView *stdView = [segue destinationViewController];
        [stdView setStudents:self.nyu.enrolledStudents];
        [stdView setCourses:[self.nyu getCourseCatalog]];
        //no rhyme or reason to this method, just wanted to have courseCatalog be private to the University class (for practice)
    }
}

@end
