//
//  RCUser+Additions.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import "RCUser.h"

@interface RCUser (Additions)

+(void)userWithID:(int)ID completion:(void (^)(RCUser *user, NSError *error))completion;

@end
