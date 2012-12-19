//
//  RCIssue+Additions.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import "RCIssue.h"

@interface RCIssue (Additions)

-(void)postWithErrorHandler:(void (^)(NSError *error))block;

@end
