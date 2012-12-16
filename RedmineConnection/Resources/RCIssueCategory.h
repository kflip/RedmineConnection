//
//  IssueCategory.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 14.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RCProject;
@class RCUser;

@interface RCIssueCategory : NSObject

@property(nonatomic) NSUInteger issueCategoryID;
@property(nonatomic, strong) RCProject *project;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) RCUser *assignedTo;


@end
