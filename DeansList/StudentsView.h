//
//  StudentsView.h
//  DeansList
//
//  Created by Louis Tur on 2/9/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning this is a forward declaration?
@class StudentsView;

@protocol StudentViewControllerDelegate

- (void) studentViewControllerDidFinish:(StudentsView *)controller;

@end

@interface StudentsView : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray * students;
@property (strong, nonatomic) NSDictionary * courses;
//reminder: this means to expect an object that conforms to listed protocol
@property (strong, nonatomic) id <StudentViewControllerDelegate> delegate;

@end
