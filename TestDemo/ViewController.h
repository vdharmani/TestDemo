//
//  ViewController.h
//  TestDemo
//
//  Created by Amit on 5/25/13.
//  Copyright (c) 2013 AcmeOfUniverse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
- (IBAction)BtnSetButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *SetMoodBtn;
@property (weak, nonatomic) IBOutlet UITextField *TxtUserName;
@property (weak, nonatomic) IBOutlet UITextField *TxtPassword;

@end
