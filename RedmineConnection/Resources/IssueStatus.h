//
//  IssueStatus.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 14.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IssueStatus : NSObject

@property(nonatomic, strong) NSNumber *statusID;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSNumber *isDefault;
@property(nonatomic, strong) NSNumber *isClosed;

@end
