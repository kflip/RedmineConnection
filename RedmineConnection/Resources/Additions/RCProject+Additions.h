//
//  RCProject+Additions.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import "RCProject.h"

@interface RCProject (Additions)

+ (void)projectsWithLimit:(int)limit offset:(int)offset completion:(void (^)(NSArray *projects, NSError *error))completion;

- (void)postWithErrorHandler:(void (^)(NSError *error))block;

- (void)issuesWithLimit:(int)limit offset:(int)offset completion:(void(^)(NSArray *issues, NSError *error))completion;

@end
