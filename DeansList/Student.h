//
//  Student.h
//  DeansList
//
//  Created by Louis Tur on 2/8/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "Person.h"

@interface Student : Person

@property (strong, nonatomic) NSString * major;
@property (strong, nonatomic) NSDate * dateOfGrad;
@property (nonatomic) BOOL fullTime;

@end
