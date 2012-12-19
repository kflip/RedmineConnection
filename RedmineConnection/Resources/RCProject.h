//
//  RCProject.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RCIssue, RCIssueCategory;

@interface RCProject : NSManagedObject

@property (nonatomic, retain) NSNumber * projectID;
@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) NSString * descr;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *issues;
@property (nonatomic, retain) NSSet *issueCategories;
@end

@interface RCProject (CoreDataGeneratedAccessors)

- (void)addIssuesObject:(RCIssue *)value;
- (void)removeIssuesObject:(RCIssue *)value;
- (void)addIssues:(NSSet *)values;
- (void)removeIssues:(NSSet *)values;

- (void)addIssueCategoriesObject:(RCIssueCategory *)value;
- (void)removeIssueCategoriesObject:(RCIssueCategory *)value;
- (void)addIssueCategories:(NSSet *)values;
- (void)removeIssueCategories:(NSSet *)values;

@end
