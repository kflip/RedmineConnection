//
//  Issue.m
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 14.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import "Issue.h"
#import "IssueCategory.h"
#import "IssueStatus.h"
#import "User.h"
#import "Project.h"
#import "Tracker.h"

#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "Settings.h"


@implementation Issue

+ (BOOL) AMCEnabled
{
    return YES;
}

-(void)postWitherrorHandler:(void (^)(NSError *error))block {
    Settings *settings = [Settings sharedInstance];
    NSString *urlString = [NSString stringWithFormat:@"%@issues.json?key=%@", settings.serverURL, settings.apiKey];
    NSURL *url = [NSURL URLWithString:urlString];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            self.project.projectID, @"issue[project_id]",
                            self.subject, @"issue[subject]",
                            self.status.statusID, @"issue[status_id]",
                            self.description, @"issue[description]",
                            nil];
         
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:[url absoluteString] parameters:params];

    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        block(nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error.localizedDescription);
        block(error);
    }];
    
    [operation start];
}

@end
