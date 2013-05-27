//
//  AppDelegate.h
//  TestDemo
//
//  Created by Amit on 5/25/13.
//  Copyright (c) 2013 AcmeOfUniverse. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
	NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;

}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic,strong) NSString *MoodString;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
