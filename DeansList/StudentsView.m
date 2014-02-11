//
//  StudentsView.m
//  DeansList
//
//  Created by Louis Tur on 2/9/14.
//  Copyright (c) 2014 Louis Tur. All rights reserved.
//

#import "StudentsView.h"

@interface StudentsView ()
@property (strong, nonatomic) IBOutlet UITableView *studentTable;
@property (strong, nonatomic) IBOutlet UITableView *coursesTable;

@end

@implementation StudentsView{
    NSArray * justCourseNames;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

#warning this is hard coded. come back to this
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.studentTable){
        return self.students.count;
    }else{//coursesTable
        if (section == 0) {
            return 3;
        }else if (section == 1){
            return 1;
        }else{
            return 1;
        }
        //return [[self.courses allKeys] count];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
#warning this is hard coded. come back to this
    if (tableView == self.studentTable){
        return @"Enrolled Students";
    }
    else{
        if(section == 0){
            return @"Computer Science Department";
        }else if (section == 1){
            return @"Biology Department";
        }else{
            return @"Chemistry Department";
        }
    }
}

//if necessary
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSDateFormatter *dFormat = [[NSDateFormatter alloc] init];
    [dFormat setDateFormat:@"|   yyyy  -  MM"];
    NSDate *date = [NSDate date];
    //NSString *todayString = [dateFormatter stringFromDate:[NSDate date]];
    NSString *nyuToday = [NSString stringWithFormat:@"New York University    %@",[dFormat stringFromDate:date] ];
    return nyuToday;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.studentTable){
        return 1;
    }else{
#warning this is hard coded. come back to this
        return 3;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *stdCell;
    //first checks for which table
    if (tableView == self.studentTable) {
        stdCell = [tableView dequeueReusableCellWithIdentifier:@"studentCell" forIndexPath:indexPath];
        stdCell.textLabel.text = [self.students[indexPath.row] name];
        stdCell.textLabel.textColor = [UIColor whiteColor];
    }
    else{
        stdCell = [tableView dequeueReusableCellWithIdentifier:@"courseCell" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            stdCell.textLabel.text = justCourseNames[indexPath.row];
#warning **PRIORITY*** need to update this
        }else if (indexPath.section == 1 ){
            stdCell.textLabel.text = @"Bio Courses";
        }else{
            stdCell.textLabel.text = @"Chem Courses";
        }
        //stdCell.textLabel.text = [self.courses valueForKey: justCourseNames[indexPath.row]];
        stdCell.textLabel.textColor = [UIColor whiteColor];
    }
    
    return stdCell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.studentTable setDataSource:self];
    [self.studentTable setDelegate:self];
    
    [self.coursesTable setDataSource:self];
    [self.coursesTable setDelegate:self];
    self.coursesTable.sectionFooterHeight = 0.0;
    
    //not implemented
    justCourseNames = [NSArray arrayWithArray:[self.courses allKeys]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//Done button calls its delegate to run the studentViewControllerDidFinish: method to return to previous DeansListViewController
- (IBAction)done:(UIButton *)sender {
    [self.delegate studentViewControllerDidFinish:self];
}

@end
