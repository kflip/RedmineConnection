//
//  RCProject+Additions.m
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import "RCProject+Additions.h"
#import "RCIssue+Additions.h"

#import "RCSettings.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFJSONRequestOperation.h"


@implementation RCProject (Additions)

+ (BOOL) AMCEnabled
{
    return YES;
}

+ (void)projectsWithLimit:(int)limit offset:(int)offset completion:(void (^)(NSArray *projects, NSError *error))completion {
    RCSettings *settings = [RCSettings sharedInstance];
    NSString *urlString = [NSString stringWithFormat:@"%@projects.json?key=%@&limit=%i&offset=%i", settings.serverURL, settings.apiKey, limit, offset];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSDictionary *jsonDict = (NSDictionary*)JSON;
        NSMutableArray *result = [NSMutableArray array];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        
        NSArray *projects = [jsonDict objectForKey:@"projects"];
        for (int i=0; i<[projects count]; i++) {
            NSDictionary *dict = [projects objectAtIndex:i];
            
            RCProject *project = [[RCProject alloc] init];
            project.createdAt = [dateFormatter dateFromString:[dict valueForKey:@"created_on"]];
            project.updatedAt = [dateFormatter dateFromString:[dict valueForKey:@"updated_on"]];
            project.descr = [dict valueForKey:@"description"];
            project.projectID = [NSNumber numberWithInt:[[dict valueForKey:@"id"] intValue]];
            project.identifier = [dict valueForKey:@"identifier"];
            project.name = [dict valueForKey:@"name"];
            
            [result addObject:project];
        }
        
        completion(result, nil);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        completion(nil, error);
    }];
    
    
    [operation start];
}

- (void)postWithErrorHandler:(void (^)(NSError *error))block {
    RCSettings *settings = [RCSettings sharedInstance];
    NSString *urlString = [NSString stringWithFormat:@"%@projects.json?key=%@", settings.serverURL, settings.apiKey];
    NSURL *url = [NSURL URLWithString:urlString];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            self.name, @"project[name]",
                            self.identifier, @"project[identifier]",
                            self.description, @"project[description]",
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

- (void)issuesWithLimit:(int)limit offset:(int)offset completion:(void(^)(NSArray *issues, NSError *error))completion {
    RCSettings *settings = [RCSettings sharedInstance];
    NSString *urlString = [NSString stringWithFormat:@"%@projects/%i/issues.json?key=%@&limit=%i&offset=%i", settings.serverURL, [self.projectID intValue], settings.apiKey, limit, offset];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSMutableArray *result = [NSMutableArray array];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        
        NSArray *issues = [(NSDictionary*)JSON objectForKey:@"issues"];
        
        for (int i=0; i < [issues count]; i++) {
            NSDictionary *dict = [issues objectAtIndex:i];
            
            RCIssue *issue = [[RCIssue alloc] init];
            issue.startDate = [dateFormatter dateFromString:[dict valueForKey:@"start_date"]];
            issue.estimatedHours = @([[dict valueForKey:@"estimated_hours"] intValue]);
            issue.createdAt = [dateFormatter dateFromString:[dict valueForKey:@"created_on"]];
            issue.updatedAt = [dateFormatter dateFromString:[dict valueForKey:@"updated_on"]];
            //issue.author
            //issue.priority
            //issue.subject
            //issue.issueID
            //issue.project
            //issue.tracker
            //issue.dueDate
            //issue.description
            //issue.status
            
            [result addObject:issue];
        }
        
        completion(result, nil);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        completion(nil, error);
    }];
    
    [operation start];
}


@end
