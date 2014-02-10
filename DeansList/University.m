//
//  University.m
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "University.h"

@interface University ()

@property (strong, nonatomic) NSMutableDictionary *courseCatalog;//keys are courses

@end

@implementation University

- (id)init
{
    self = [super init];
    if (self) {
        _universityName = @"New York University";
        _universityLocation = @"New York, NY";
        
        if ( !_departments || !_enrolledStudents || !_hiredStaff)//lazy instatiation of departments
        {
            _departments = [NSMutableArray array];
            _enrolledStudents = [NSMutableArray array];
            _hiredStaff = [NSMutableArray array];
        }
        
    }
    return self;
}

-(NSString *)description{
    return _universityName;
}

+ (NSArray *)getDepartments {
    return @[@"Computer Science Department",@"Biology Department",@"Chemistry Department"];
}

- (void)addDepartment:(University *)newDepartment{
    [_departments addObject:newDepartment];
}

- (void)enrollStudent:(NSArray *)student{
    for (id std in student) {
        [_enrolledStudents addObject:std];
    }
}
-(void)hireStaff:(NSArray *)staff{
    for (id stf in staff){
        [_hiredStaff addObject:stf];
    }
}

-(void)addCourseID:(University *)courseID withName:(NSString *)courseName{
    
    if(!_courseCatalog){
        _courseCatalog = [NSMutableDictionary dictionary];
    }
    [self.courseCatalog setValue:courseID forKey:courseName];
    
}
-(NSDictionary *)getCourseCatalog{
    return self.courseCatalog;
}

@end
