//
//  Person.h
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic, readonly) NSString * name;
@property (strong, nonatomic) NSDate * dateOfBirth;
@property (strong, nonatomic) NSString * SSN;

- (void) newName:(NSString *) theName;
- (id) initWithName: (NSString *) theName SSN: (NSString *) theSSN andDOB: (NSDate *) theDOB;

@end
