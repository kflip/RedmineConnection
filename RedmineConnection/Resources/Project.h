//
//  Project.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 09.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject

@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSNumber *projectID;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;

- (void)postWithErrorHandler:(void (^)(NSError *error))block;

+ (void)receiveWithLimit:(int)limit offset:(int)offset completion:(void (^)(NSArray *projects, NSError *error))completion;

@end
