//
//  ViewController.m
//  TestDemo
//
//  Created by Amit on 5/25/13.
//  Copyright (c) 2013 AcmeOfUniverse. All rights reserved.
//

#import "ViewController.h"
#import "MoodViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize SetMoodBtn,TxtPassword,TxtUserName;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"Please Fill Fields";
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    
    TxtPassword.secureTextEntry=YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    SetMoodBtn.layer.cornerRadius=20.5;
    
}
-(void)viewWillAppear:(BOOL)animated{
   
    NSUserDefaults *Logedin = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
    NSString *myString = [Logedin stringForKey:@"UserLogedIn"];
    
    if(myString){
        MoodViewController *dtl=[[MoodViewController alloc]initWithNibName:@"MoodViewController" bundle:nil];
        [self.navigationController pushViewController:dtl animated:NO];

    }
    
}
#pragma mark - Button pressed
- (IBAction)BtnSetButtonPressed:(id)sender {

    if([TxtUserName.text isEqualToString:@"admin"]&&[TxtPassword.text isEqualToString:@"admin"]){
        
        NSUserDefaults *Logedin = [NSUserDefaults standardUserDefaults];
        [Logedin setObject:@"admin" forKey:@"UserLogedIn"];

        [Logedin synchronize];
    MoodViewController *dtl=[[MoodViewController alloc]initWithNibName:@"MoodViewController" bundle:nil];
        
        
        
        [UIView  transitionWithView:self.navigationController.view duration:0.8  options:UIViewAnimationOptionTransitionFlipFromLeft
                         animations:^(void) {
                             BOOL oldState = [UIView areAnimationsEnabled];
                             [UIView setAnimationsEnabled:NO];
                             [self.navigationController pushViewController:dtl animated:YES];
                             [UIView setAnimationsEnabled:oldState];
                         }
                         completion:nil];

    }else{
        [[[UIAlertView alloc]initWithTitle:@"Alert!" message:@"Entered User name or password is Wrong!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil]show];
        
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [TxtPassword resignFirstResponder];
    [TxtUserName resignFirstResponder];
    
    return YES;
    
}
@end
