//
//  MoodLogViewController.h
//  TestDemo
//
//  Created by Amit on 5/26/13.
//  Copyright (c) 2013 AcmeOfUniverse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoodLogViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *MoodTableview;
@property (nonatomic,retain) NSMutableArray *eventsArray;
@end
