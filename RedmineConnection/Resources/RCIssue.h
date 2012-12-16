//
//  Issue.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 14.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCIssueCategory;
@class RCIssueStatus;
@class RCUser;
@class RCProject;
@class RCTracker;

@interface RCIssue : NSObject

@property(nonatomic, strong) NSDate *startDate;
@property(nonatomic, strong) NSNumber *issueID;
@property(nonatomic, strong) RCIssueCategory *category;
@property(nonatomic, strong) RCUser *assignedTo;
@property(nonatomic, strong) NSDate *createdAt;
@property(nonatomic, strong) NSDate *updatedAt;
@property(nonatomic, strong) RCUser *author;
@property(nonatomic, strong) NSString *subject;
@property(nonatomic, strong) NSString *description;
@property(nonatomic, strong) RCProject *project;
@property(nonatomic, strong) RCTracker *tracker;
@property(nonatomic, strong) RCIssueStatus *status;

-(void)postWitherrorHandler:(void (^)(NSError *error))block;

@end
