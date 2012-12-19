//
//  RCIssueCategory.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RCIssue, RCProject, RCUser;

@interface RCIssueCategory : NSManagedObject

@property (nonatomic, retain) NSNumber * issueCategoryID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) RCProject *project;
@property (nonatomic, retain) RCUser *assignedTo;
@property (nonatomic, retain) NSSet *issues;
@end

@interface RCIssueCategory (CoreDataGeneratedAccessors)

- (void)addIssuesObject:(RCIssue *)value;
- (void)removeIssuesObject:(RCIssue *)value;
- (void)addIssues:(NSSet *)values;
- (void)removeIssues:(NSSet *)values;

@end
