//
//  Tracker.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 14.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCTracker : NSObject

@property(nonatomic) NSUInteger trackerID;
@property(nonatomic, strong) NSString *name;

@end
