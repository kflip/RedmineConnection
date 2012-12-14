//
//  Settings.m
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 09.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import "Settings.h"

@interface Settings ()



@end


@implementation Settings

+ (Settings*)sharedInstance
{
    static Settings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Settings alloc] init];
        
        [sharedInstance initPlist];
    });
    return sharedInstance;
}

-(void)initPlist {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        
    self.apiKey = [dict valueForKey:@"APIKey"];
    self.serverURL = [dict valueForKey:@"ServerURL"];
    self.format = [[dict valueForKey:@"ResponseFormat"] valueForKey:@"Default"];
}

-(NSString*)serverURL {
    if ([_serverURL characterAtIndex:[_serverURL length]-1] != '/') {
        _serverURL = [NSString stringWithFormat:@"%@/", _serverURL];
    }
    
    return _serverURL;
}

@end
