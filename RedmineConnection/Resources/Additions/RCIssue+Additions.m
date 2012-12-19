//
//  RCIssue+Additions.m
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import "RCIssue+Additions.h"
#import "RCProject+Additions.h"
#import "RCIssueStatus+Addition.h"

#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "RCSettings.h"
#import "NSObject+AutoMagicCoding.h"


@implementation RCIssue (Additions)

+ (BOOL) AMCEnabled
{
    return YES;
}


-(void)postWithErrorHandler:(void (^)(NSError *error))block {
    RCSettings *settings = [RCSettings sharedInstance];
    NSString *urlString = [NSString stringWithFormat:@"%@issues.json?key=%@", settings.serverURL, settings.apiKey];
    NSURL *url = [NSURL URLWithString:urlString];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          self.project.projectID, @"project_id",
                          self.subject, @"subject",
                          self.status.statusID, @"status_id",
                          self.description, @"description"
                          , nil];
    NSDictionary *params = [NSDictionary dictionaryWithObject:dict forKey:@"issue"];
    
    
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
