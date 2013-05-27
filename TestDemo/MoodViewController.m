//
//  MoodViewController.m
//  TestDemo
//
//  Created by Amit on 5/25/13.
//  Copyright (c) 2013 AcmeOfUniverse. All rights reserved.
//

#import "MoodViewController.h"
#import "AppDelegate.h"
#import "MoodDetail.h"
#import "MoodLogViewController.h"
@interface MoodViewController ()
{
    int btntag;
   // AppDelegate *ApplicationDel;
}
@end

@implementation MoodViewController
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
    
    self.title=@"Click and Set Your Mood";

//   // ApplicationDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    // Do any additional setup after loading the view from its nib.
//    btntag=0;
//    UIButton *btn=[[UIButton alloc]init];
//    btn.titleLabel.text=@"Log";
//    
//   // UIBarButtonItem *donebtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(GOtoMoodLog:)];
//    
//    
//    UIButton* donebtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    donebtn.titleLabel.text=@"LOG";
//    [donebtn addTarget:self action:@selector(GOtoMoodLog:)          forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *donebtn1 = [[UIBarButtonItem alloc]
//                                            initWithCustomView:donebtn];
//    self.navigationItem.rightBarButtonItem = donebtn1;
//    
    
   // UIBarButtonItem *LogBtn=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
   // donebtn.title=@"LOG";
    self.navigationController.navigationBar.hidden=TRUE;
       self.navigationItem.hidesBackButton=TRUE;
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=TRUE;
    self.navigationItem.hidesBackButton=TRUE;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)MoodBtnPressed:(id)sender {
    
    btntag=[sender tag];
    
    [[[UIAlertView alloc]initWithTitle:@"Alert!" message:@"Are you sure you want to set your Mood?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil]show ];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
        [self SetMood];
        
    }
}
-(void)SetMood
{
    NSString *msg=[[NSString alloc]init];
    
    switch (btntag) {
        case 1:{
            msg=@"Happy mood has been Set";
//            UILocalNotification *    localNotifEndCycle = [[UILocalNotification alloc] init];
//            localNotifEndCycle.alertBody = @"Your Expected Date ";
//            NSDate *now = [NSDate date];
//            
//            for( int i = 1; i <= 10;i++)
//            {
//                localNotifEndCycle.alertBody = @"Your Expected Date ";
//                localNotifEndCycle.soundName=@"best_guitar_tone.mp3";
//                localNotifEndCycle.fireDate = [NSDate dateWithTimeInterval:180*i sinceDate:now];
//                [[UIApplication sharedApplication] scheduleLocalNotification: localNotifEndCycle];
//            }
//
            ApplicationDelegate.MoodString=msg;
            
            
            MoodDetail *addmood = (MoodDetail *)[NSEntityDescription insertNewObjectForEntityForName:@"MoodDetail" inManagedObjectContext:ApplicationDelegate.managedObjectContext];
            addmood.states=@"Ecstatic Mood";
            NSDate *today = [NSDate date];
            addmood.detail=today;
            

            
            break;
        }
        case 2:
        {
            msg=@"Angry mood has been Set";
            ApplicationDelegate.MoodString=msg;
            MoodDetail *addmood = (MoodDetail *)[NSEntityDescription insertNewObjectForEntityForName:@"MoodDetail" inManagedObjectContext:ApplicationDelegate.managedObjectContext];
            addmood.states=@"Happy Mood";
            NSDate *today = [NSDate date];
            addmood.detail=today;
            break;
        }
        case 3:{
            msg=@"Sad mood has been Set";
            ApplicationDelegate.MoodString=msg;
            MoodDetail *addmood = (MoodDetail *)[NSEntityDescription insertNewObjectForEntityForName:@"MoodDetail" inManagedObjectContext:ApplicationDelegate.managedObjectContext];
            addmood.states=@"Ok Mood";
            NSDate *today = [NSDate date];
            addmood.detail=today;
            break;
        }
        case 4:{
            msg=@"Cry mood has been Set";
            ApplicationDelegate.MoodString=msg;
            MoodDetail *addmood = (MoodDetail *)[NSEntityDescription insertNewObjectForEntityForName:@"MoodDetail" inManagedObjectContext:ApplicationDelegate.managedObjectContext];
            addmood.states=@"Sad Mood";
            NSDate *today = [NSDate date];
            addmood.detail=today;
            break;
        }
        case 5:{
            msg=@"Exciting mood has been Set";
            ApplicationDelegate.MoodString=msg;
            MoodDetail *addmood = (MoodDetail *)[NSEntityDescription insertNewObjectForEntityForName:@"MoodDetail" inManagedObjectContext:ApplicationDelegate.managedObjectContext];
            addmood.states=@"Depressed Mood";
            NSDate *today = [NSDate date];
            addmood.detail=today;
            break;
        }
        default:
            break;
    }
    
    NSError *savingError = nil;
    
    if(![[ApplicationDelegate managedObjectContext] save:&savingError])
    {
        //Handle Errors on saving
        UIAlertView *errorOnSave = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Some error occured while saving your data. Please try again." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        
        [errorOnSave  show];
    }

    [[[UIAlertView alloc]initWithTitle:@"Notification" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil]show ];
  
}

-(IBAction)GOtoMoodLog:(id)sender
{
    
    MoodLogViewController *dtl=[[MoodLogViewController alloc]initWithNibName:@"MoodLogViewController" bundle:nil];
    

    
    
    
    [UIView  transitionWithView:self.navigationController.view duration:0.8  options:UIViewAnimationOptionTransitionFlipFromLeft
                     animations:^(void) {
                         BOOL oldState = [UIView areAnimationsEnabled];
                         [UIView setAnimationsEnabled:NO];
                         [self.navigationController pushViewController:dtl animated:YES];
                         [UIView setAnimationsEnabled:oldState];
                     }
                     completion:nil];
//    [UIView beginAnimations:@"animation" context:nil];
//    
//    [self.navigationController pushViewController: dtl animated:NO];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:YES];
//    [UIView commitAnimations];
//   
    
//    dtl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self.navigationController pushViewController:dtl animated:YES];
    
}



@end
