//
//  MoodDetail.h
//  TestDemo
//
//  Created by Amit on 5/25/13.
//  Copyright (c) 2013 AcmeOfUniverse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MoodDetail : NSManagedObject

@property (nonatomic, retain) NSString * states;
@property (nonatomic, retain) NSDate * detail;

@end
