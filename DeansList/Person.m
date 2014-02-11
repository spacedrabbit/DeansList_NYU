//
//  Person.m
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (strong, nonatomic) NSString * name;

@end

@implementation Person

-(id)initWithName:(NSString *)theName SSN:(NSString *)theSSN andDOB:(NSDate *)theDOB{
    
    self = [super init];
    if (self) {
        _name = theName;
        _dateOfBirth = theDOB;
        _SSN = theSSN;
        if (!_associatedCourses) {
            _associatedCourses = [NSMutableArray array];
        }
    }
    return self;
}

- (id)init
{
    return [self initWithName:@"No Name" SSN:@"No SSN" andDOB:NULL];
}

-(NSString *)description{
    return self.name;
}

- (void)newName:(NSString *)theName{
    _name = theName;
}

@end
