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

@property (strong, nonatomic) IBOutlet UITextView *consoleOutput;

@end

@implementation DeansViewViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    /*********************************************
     
        Setting up school, depts, and courses
     
     
     ********************************************/
    
	self.nyu = [[University alloc] init];
    NSLog(@"%@", self.nyu);
    
    UniversityDepartments * compSciDept = [UniversityDepartments new];
    compSciDept.departmentName = @"Computer Science Department";
    [self.nyu addDepartment:compSciDept];
    
    UniversityDepartments * bioDept = [UniversityDepartments new];
    bioDept.departmentName = @"Biology Department";
    [self.nyu addDepartment:bioDept];
    
    UniversityDepartments * chemDept = [UniversityDepartments new];
    chemDept.departmentName = @"Chemistry Department";
    [self.nyu addDepartment:chemDept];
    
    Course * compSci101 = [[Course alloc] initCourseWithName:@"Intro to ObjC"];
    [compSciDept addCoursesObject:compSci101];
    
    Course * compSci201 = [[Course alloc] initCourseWithName:@"Data Structures"];
    [compSciDept addCoursesObject:compSci201];
    
    Course * compSci202 = [[Course alloc] initCourseWithName:@"Into to Java"];
    [compSciDept addCoursesObject:compSci202];
    
    Course * chem101 = [Course new];
    [chem101 changeCourseName:@"Molecular Chemistry"];
    [chemDept addCoursesObject:chem101];
    
    /*********************************************
     
     Setting up staff and students
     
     
     ********************************************/
    
    Staff * eWang = [[Staff alloc] initWithName:@"Dr. Eric Wang" SSN:@"999-999-9999" andDOB:NULL];
    Staff * pPark = [[Staff alloc] initWithName:@"Dr. Paul Park" SSN:@"999-999-9999" andDOB:NULL];
    Staff * lTur = [[Staff alloc] initWithName:@"Dr. Louis Tur" SSN:@"999-999-9999" andDOB:NULL];
    
    //test of custom init's in Course Class
    Course * bio101 = [[Course alloc] initCourseWithName:@"Intro to Biology" andProfessor:pPark];
    [bioDept addCoursesObject:bio101];
    
    //To Do: have this information imported from file
    Student * jNorris = [[Student alloc] initWithName:@"Jim Norris" SSN:@"999-999-9999" andDOB:NULL];
    Student * sKoonin = [[Student alloc] initWithName:@"Shawn Koonin" SSN:@"999-999-9999" andDOB:NULL];
    Student * dDaniel = [[Student alloc] initWithName:@"Devin O' Daniel" SSN:@"999-999-9999" andDOB:NULL];
    Student * dWallace = [[Student alloc] initWithName:@"Dane Wallace" SSN:@"999-999-9999" andDOB:NULL];
    Student * tHoughton = [[Student alloc] initWithName:@"Tempest Houghton" SSN:@"999-999-9999" andDOB:NULL];
    Student * jUnderwood = [[Student alloc] initWithName:@"James Underwood" SSN:@"999-999-9999" andDOB:NULL];
    
    //not yet implemented
    jNorris.fullTime = TRUE;
    sKoonin.fullTime = TRUE;
    dDaniel.fullTime = FALSE;
    dWallace.fullTime = TRUE;
    tHoughton.fullTime = FALSE;
    jUnderwood.fullTime = TRUE;
    
    [self.nyu enrollStudent:@[jNorris, sKoonin, dDaniel, dWallace, tHoughton, jUnderwood]];
    [self.nyu hireStaff:@[pPark, eWang, lTur]];
    
    //adding teachers to courses, for simplicity every class in a given department has the same teachin staff
    
    for (UniversityDepartments * depts in self.nyu.departments) {
        //runs through departments
        for (Course * crs in depts.courses) {
            //checks for what dept to assign a teacher
            if ( [depts isEqual:compSciDept] ){
                [crs setTeacher:pPark];
                [crs addAssistantTeachers:@[lTur, eWang]];
                [self.nyu addCourseID:crs withName:crs.courseName];
            }else if ([depts isEqual:bioDept]){
                [crs setTeacher:lTur];
                [self.nyu addCourseID:crs withName:crs.courseName];
            }else if ( [depts isEqual:chemDept] ){
                [crs setTeacher:eWang];
                [self.nyu addCourseID:crs withName:crs.courseName];
            }else{
                NSLog(@"Unknown Department Found. Cannot Add %@", crs);
            }
        }
    }
    
    [compSci101 addStudentsUsingId:@[jNorris, jUnderwood, dWallace, dDaniel]];
    [compSci201 addStudentsUsingId:tHoughton];
    [compSci202 addStudentsUsingId:@[jNorris, dDaniel, dWallace, sKoonin]];
    
    
    NSLog(@"%@ employs: %@", self.nyu, self.nyu.hiredStaff);
    NSLog(@"%@ enrolled the following students: %@", self.nyu, self.nyu.enrolledStudents);
    NSLog(@"%@ has the following departments: %@", self.nyu, self.nyu.departments);
    
    
    NSLog(@"The %@ has the following Courses: %@", compSciDept, compSciDept.courses);
    NSLog(@"The %@ has the following Courses: %@", bioDept, bioDept.courses);
    NSLog(@"The %@ has the following Courses: %@", chemDept, chemDept.courses);
    
    NSLog(@"%@ enrolled students: %@", compSci101, compSci101.students);
    NSLog(@"%@ enrolled students: %@", compSci201, compSci201.students);
    NSLog(@"%@ enrolled students: %@", compSci202, compSci202.students);
    
    NSLog(@"%@ is taught by %@", compSci101, compSci101.teacher);
    NSLog(@"%@ is taught by %@", bio101, bio101.teacher);
    NSLog(@"%@ is taught by %@", chem101, chem101.teacher);
    
    
    NSLog(@"%@ is enrolled in: %@", jNorris, jNorris.associatedCourses);
    NSLog(@"%@ is enrolled in: %@", dWallace, dWallace.associatedCourses);
    NSLog(@"%@ is enrolled in: %@", sKoonin, sKoonin.associatedCourses);
    
    NSLog(@"%@ teaches the following courses: %@", pPark, pPark.associatedCourses);
    NSLog(@"%@ teaches the following courses: %@", lTur, lTur.associatedCourses);
    
    NSLog(@"The %@ course has the following assistant teachers:%@", compSci201, compSci201.assistantTeachers);
    
    NSMutableString *consoleText = [NSMutableString new];
    [consoleText appendFormat:@"> Console Output\n\n> %@ employs: %@\n\n> %@ enrolled the following students: %@\n\n> %@ has the following departments: %@\n\n> The %@ has the following Courses: %@\n\n> The %@ has the following Courses: %@\n\n> The %@ has the following Courses: %@\n\n> %@ enrolled students: %@\n\n> %@ enrolled students: %@\n\n> %@ enrolled students: %@\n\n> %@ is taught by %@\n\n> %@ is taught by %@\n\n> %@ is taught by %@\n\n> %@ is enrolled in: %@\n\n> %@ is enrolled in: %@\n\n> %@ is enrolled in: %@\n\n> %@ teaches the following courses: %@\n\n> %@ teaches the following courses: %@\n\n> The %@ course has the following assistant teachers:%@",
     self.nyu, self.nyu.hiredStaff,
     self.nyu, self.nyu.enrolledStudents,
     self.nyu, self.nyu.departments,
     compSciDept, compSciDept.courses,
     bioDept, bioDept.courses,
     chemDept,chemDept.courses,
     compSci101, compSci101.students,
     compSci201, compSci201.students,
     compSci202, compSci202.students,
     compSci101, compSci101.teacher,
     bio101, bio101.teacher,
     chem101, chem101.teacher,
     jNorris, jNorris.associatedCourses,
     dWallace, dWallace.associatedCourses,
     sKoonin, sKoonin.associatedCourses,
     pPark, pPark.associatedCourses,
     lTur, lTur.associatedCourses,
     compSci201, compSci201.assistantTeachers];
    
    self.consoleOutput.text = consoleText;
    
    self.consoleOutput.textColor = [UIColor greenColor];
    self.consoleOutput.font = [UIFont fontWithName:@"Menlo" size:13.0];
    self.consoleOutput.userInteractionEnabled = TRUE;
    self.consoleOutput.showsVerticalScrollIndicator = TRUE;

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
