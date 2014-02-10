//
//  UniversityDepartments.m
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "UniversityDepartments.h"

@implementation UniversityDepartments

- (id)init
{
    self = [super init];
    if (self) {
        _courses = [NSMutableArray array];
        _departmentHead = @"None Set";
        _departmentName = @"None Set";
    }
    return self;
}

- (NSString *)description {
    return _departmentName;
}
-(void)verifyCourse:(NSString *)departmentName{
    
    //quick verification test for allowed course names
    for (NSString * str in [University getDepartments]) {
        if ([departmentName isEqualToString:str]) {
            _departmentName = str;
            break;
        }
    }
    
    //if name still nil after check
    if (!_departmentName) {
        NSLog(@"Unverified course");
    }
}

- (void)addCoursesObject:(University *)newCourse{
    [_courses addObject:newCourse];
}



@end
