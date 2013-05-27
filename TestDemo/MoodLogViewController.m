//
//  MoodLogViewController.m
//  TestDemo
//
//  Created by Amit on 5/26/13.
//  Copyright (c) 2013 AcmeOfUniverse. All rights reserved.
//

#import "MoodLogViewController.h"
#import "AppDelegate.h"
#import "MoodDetail.h"

@interface MoodLogViewController ()

@end

@implementation MoodLogViewController
@synthesize eventsArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self fetchRecords];
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=FALSE;
    
    // initialize button and button view
    UIButton* backButton = [UIButton buttonWithType:101];
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, backButton.frame.size.width, backButton.frame.size.height)];
    
    [backButton addTarget:self action:@selector(backBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    backButton.tintColor=[UIColor blackColor];
    [backButtonView addSubview:backButton];
    
    // set buttonview as custom view for bar button item
    UIBarButtonItem* backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    
    
    
       
}

-(void)viewWillDisappear:(BOOL)animated
{
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchRecords {
    NSError *errFetch = nil;
    //Active password
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    
    //NSEntityDescription *actentity=[self doEntitY:@"Contact"];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MoodDetail" inManagedObjectContext:ApplicationDelegate.managedObjectContext];
    
    [request setEntity:entity];
    NSSortDescriptor *sortDecs=[[NSSortDescriptor alloc]initWithKey:@"states" ascending:NO];
    NSArray *sortDescArray=[[NSArray alloc]initWithObjects:sortDecs, nil];
    [request setSortDescriptors:sortDescArray];
    
    NSMutableArray *mutableFetchResults=[[ApplicationDelegate.managedObjectContext executeFetchRequest:request error:&errFetch]mutableCopy];
    NSLog(@"mutablefatchresulet is %@",mutableFetchResults);
    
    [self setEventsArray:mutableFetchResults];
    
    
    
}

#pragma mark - Table View

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return [[self.fetchedResultsController sections] count];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [eventsArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text=[[eventsArray objectAtIndex:indexPath.row] valueForKey:@"states"];

    
    
    return cell;
}

#pragma mark - Back
-(IBAction)backBtn:(id)sender{
    [UIView  transitionWithView:self.navigationController.view duration:0.8  options:UIViewAnimationOptionTransitionFlipFromLeft
                     animations:^(void) {
                         BOOL oldState = [UIView areAnimationsEnabled];
                         [UIView setAnimationsEnabled:NO];
                         [self.navigationController popViewControllerAnimated:NO];
                         [UIView setAnimationsEnabled:oldState];
                     }
                     completion:nil];

}

@end
