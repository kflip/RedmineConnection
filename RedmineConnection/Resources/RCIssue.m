//
//  RCIssue.m
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import "RCIssue.h"
#import "RCIssueCategory.h"
#import "RCIssueStatus.h"
#import "RCProject.h"
#import "RCTracker.h"
#import "RCUser.h"


@implementation RCIssue

@dynamic issueID;
@dynamic startDate;
@dynamic estimatedHours;
@dynamic createdAt;
@dynamic updatedAt;
@dynamic subject;
@dynamic descr;
@dynamic category;
@dynamic assignedTo;
@dynamic author;
@dynamic project;
@dynamic tracker;
@dynamic status;

@end
