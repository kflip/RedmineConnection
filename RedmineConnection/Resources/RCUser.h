//
//  RCUser.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RCIssue, RCIssueCategory;

@interface RCUser : NSManagedObject

@property (nonatomic, retain) NSNumber * userID;
@property (nonatomic, retain) NSString * login;
@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) NSSet *authorIssues;
@property (nonatomic, retain) NSSet *assignedIssues;
@property (nonatomic, retain) NSSet *assignedCategories;
@end

@interface RCUser (CoreDataGeneratedAccessors)

- (void)addAuthorIssuesObject:(RCIssue *)value;
- (void)removeAuthorIssuesObject:(RCIssue *)value;
- (void)addAuthorIssues:(NSSet *)values;
- (void)removeAuthorIssues:(NSSet *)values;

- (void)addAssignedIssuesObject:(RCIssue *)value;
- (void)removeAssignedIssuesObject:(RCIssue *)value;
- (void)addAssignedIssues:(NSSet *)values;
- (void)removeAssignedIssues:(NSSet *)values;

- (void)addAssignedCategoriesObject:(RCIssueCategory *)value;
- (void)removeAssignedCategoriesObject:(RCIssueCategory *)value;
- (void)addAssignedCategories:(NSSet *)values;
- (void)removeAssignedCategories:(NSSet *)values;

@end
