//
//  RCIssue.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RCIssueCategory, RCIssueStatus, RCProject, RCTracker, RCUser;

@interface RCIssue : NSManagedObject

@property (nonatomic, retain) NSNumber * issueID;
@property (nonatomic, retain) NSDate * startDate;
@property (nonatomic, retain) NSNumber * estimatedHours;
@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) NSString * subject;
@property (nonatomic, retain) NSString * descr;
@property (nonatomic, retain) RCIssueCategory *category;
@property (nonatomic, retain) RCUser *assignedTo;
@property (nonatomic, retain) RCUser *author;
@property (nonatomic, retain) RCProject *project;
@property (nonatomic, retain) RCTracker *tracker;
@property (nonatomic, retain) RCIssueStatus *status;

@end
