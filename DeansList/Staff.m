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
    [self.associatedCourses addObject:courseName];

}

-(NSArray *)showCoursesTaught{
    
#warning need to add course!=nil check here
    return self.associatedCourses;
}
@end
