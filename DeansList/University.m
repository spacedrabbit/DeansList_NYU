//
//  University.m
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "University.h"

@class UniversityDepartments;
@interface University ()

@property (strong, nonatomic) NSMutableDictionary *courseCatalog;//keys are courses

@end

@implementation University

- (id)init
{
#warning so, it is that _variable directly calls the value stored in the instance variable whereas self.variable is a reference to where the variable is stored in memory? If so, what is the difference in calling either? I know it is preferable to call self.variable where possible
    self = [super init];
    if (self) {
        _universityName = @"New York University";
        //example, here if I call self.university, it gives me an error that it is a read-only property. so does it relate to the idea that an @property declaration is more than just a value? thus, you can directly manipulate _university but not self.university and in that way it is safer to use.
        _universityLocation = @"New York, NY";
        
        if ( !_departments || !_enrolledStudents || !_hiredStaff)
        {
            self.departments = [NSMutableArray array];
            self.enrolledStudents = [NSMutableArray array];
            self.hiredStaff = [NSMutableArray array];
        }
        
    }
    return self;
}

-(NSString *)description{
    return self.universityName;
}

+ (NSArray *)getDepartments {
    return @[@"Computer Science Department",@"Biology Department",@"Chemistry Department"];
}

- (void)addDepartment:(UniversityDepartments *)newDepartment{
    [self.departments addObject:newDepartment];
}

- (void)enrollStudent:(NSArray *)student{
    for (id std in student) {
        [self.enrolledStudents addObject:std];
    }
}
-(void)hireStaff:(NSArray *)staff{
    for (id stf in staff){
        [self.hiredStaff addObject:stf];
    }
}

//used, but not fully implemented
-(void)addCourseID:(University *)courseID withName:(NSString *)courseName{
    
    if(!_courseCatalog){
        self.courseCatalog = [NSMutableDictionary dictionary];
    }
    [self.courseCatalog setValue:courseID forKey:courseName];
    
}
-(NSDictionary *)getCourseCatalog{
    return self.courseCatalog;
}


@end
