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
- (id)init
{
    self = [super init];
    if (self) {
        _courseName = @"None Set";
        _teacher = [Staff new];
        _students = [NSMutableArray new];
    }
    return self;
}

- (void)changeCourseName: (NSString *) newName {
    self.courseName = newName;
}

//overwritten description
-(NSString *)description{
    return self.courseName;
}

-(void)addStudentsObject:(Student *) studentName {
    [_students addObject:studentName];
}

//checks to see if there is a current teacher set first
- (void)changeTeacher:(Staff *)newTeacher {
    if (_teacher) {
        _teacher = newTeacher;
    }
    else{
        NSLog(@"There are no current teachers");
    }
}

-(void)addAssistantTeachers:(NSArray *)asstTeachers{
    
    if (!_assistantTeachers) {
        _assistantTeachers = [NSMutableArray array];
    }
    
    [_assistantTeachers addObjectsFromArray:asstTeachers];
}

#warning Does this compare the memory address or some other property of the object?
- (void)dropStudent:(Student *)studentName
{
    [self.students removeObjectIdenticalTo:studentName];
}

@end
