//
//  Course.m
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "Course.h"
#import "Staff.h"
#import "Student.h"

@interface Course ()

@property (strong, nonatomic) NSString * courseName;

@end

@implementation Course

-(id)initCourseWithName:(NSString *)name andProfessor:(Staff *)prof{
    self = [super init];
    if (self) {
        self.courseName = [NSString stringWithString:name];
        self.students = [NSMutableArray new];
        if (!_teacher) {
            _teacher = [Staff new];
        }
        _teacher = prof;
        _assistantTeachers = [NSMutableArray array];
    }
    return self;
}


-(id)initCourseWithName:(NSString *)name{
    return [self initCourseWithName:name andProfessor:nil];
}

- (id)init
{
    return [self initCourseWithName:@"No Name"];
}

- (void)changeCourseName: (NSString *) newName {
    self.courseName = newName;
}

//overwritten setter to call assignToCourse:(Course*)
-(void)setTeacher:(Staff *)teacher{
    _teacher = teacher;
    [teacher assignToCourse:self];
}

//overwritten description
-(NSString *)description{
    return self.courseName;
}

/*
first, adds student to the course object
then, adds the course to the student object
not sure if this is a good practice, since the student object
 probably doesn't need to know any information about the course
 other than it's name. If needed, could contruct a method where 
 [course.courseName isEqualTo:student.course[N].name] is checked
 to return the proper object
 
 though there may be benefits to this design since the student class
 could theoretically access the course information quite easily
 */
-(void)addStudentsObject:(Student *) studentName {
    [self.students addObject:studentName];
    [studentName.associatedCourses addObject:self];
}


//much more flexible method to enroll students in Course object
- (void) addStudentsUsingId:(id)students{
    if ([students isKindOfClass:[NSArray class]])
    {//checks for NSArray and subclasses
        for (Person * std in students)
        {
            [self.students addObject:std];
            [std.associatedCourses addObject:self];
        }
    }
    else if ([students isKindOfClass:[Person class]])
    {//checks or Person and subclasses (student and staff will work)
        Person * itsAStudent = students;//necessary to access correct properties and methods
        [self.students addObject:itsAStudent];
        [itsAStudent.associatedCourses addObject:self];
    }
    else{
        NSLog(@"You did not pass a proper class: %@ passed", students);
    }
}

//checks to see if there is a current teacher set first
// does this count as a setter, so I can use underbar?
- (void)changeTeacher:(Staff *)newTeacher {
    if (_teacher) {
        _teacher = newTeacher;
    }
    else{
        NSLog(@"There are no current teachers");
    }
}

// assistant teachers, why not?
-(void)addAssistantTeachers:(NSArray *)asstTeachers{
    [self.assistantTeachers addObjectsFromArray:asstTeachers];
}

#warning Does this compare the memory address or some other property of the object? i think i looked this up.. compares memory address and hash?
- (void)dropStudent:(Student *)studentName
{
    [self.students removeObjectIdenticalTo:studentName];
}

@end
