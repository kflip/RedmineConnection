//
//  Issue.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 14.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IssueCategory;
@class IssueStatus;
@class User;
@class Project;
@class Tracker;

@interface Issue : NSObject

@property(nonatomic, strong) NSDate *startDate;
@property(nonatomic, strong) NSNumber *issueID;
@property(nonatomic, strong) IssueCategory *category;
@property(nonatomic, strong) User *assignedTo;
@property(nonatomic, strong) NSDate *createdAt;
@property(nonatomic, strong) NSDate *updatedAt;
@property(nonatomic, strong) User *author;
@property(nonatomic, strong) NSString *subject;
@property(nonatomic, strong) NSString *description;
@property(nonatomic, strong) Project *project;
@property(nonatomic, strong) Tracker *tracker;
@property(nonatomic, strong) IssueStatus *status;

-(void)postWitherrorHandler:(void (^)(NSError *error))block;

@end
