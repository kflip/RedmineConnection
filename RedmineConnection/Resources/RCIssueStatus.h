//
//  RCIssueStatus.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RCIssue;

@interface RCIssueStatus : NSManagedObject

@property (nonatomic, retain) NSNumber * statusID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * isDefault;
@property (nonatomic, retain) NSNumber * isClosed;
@property (nonatomic, retain) NSSet *issues;
@end

@interface RCIssueStatus (CoreDataGeneratedAccessors)

- (void)addIssuesObject:(RCIssue *)value;
- (void)removeIssuesObject:(RCIssue *)value;
- (void)addIssues:(NSSet *)values;
- (void)removeIssues:(NSSet *)values;

@end
