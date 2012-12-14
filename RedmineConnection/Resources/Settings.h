//
//  Settings.h
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 09.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

@property(nonatomic, strong) NSString *apiKey;

@property(nonatomic, strong) NSString *serverURL;

@property(nonatomic, strong) NSString *format;

+ (Settings*)sharedInstance;

@end
