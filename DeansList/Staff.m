//
//  Staff.m
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "Staff.h"

@implementation Staff

-(void)assignToCourse:(Course *)courseName {
    
    if (!_coursesTaught) {
        _coursesTaught = [NSMutableArray array];
    }
    
    [_coursesTaught addObject:courseName];
}

-(NSArray *)showCoursesTaught{
    
#warning need to add course!=nil check here
    return _coursesTaught;
}
@end
