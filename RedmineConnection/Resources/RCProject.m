//
//  Project.m
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 09.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import "RCProject.h"
#import "RCSettings.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFJSONRequestOperation.h"

@implementation RCProject

+ (BOOL) AMCEnabled
{
    return YES;
}

-(void)postWithErrorHandler:(void (^)(NSError *error))block {
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

+ (void)receiveWithLimit:(int)limit offset:(int)offset completion:(void (^)(NSArray *projects, NSError *error))completion {
    RCSettings *settings = [RCSettings sharedInstance];
    NSString *urlString = [NSString stringWithFormat:@"%@projects.json?key=%@&limit=%i&offset=%i", settings.serverURL, settings.apiKey, limit, offset];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSDictionary *jsonDict = (NSDictionary*)JSON;
        NSLog(@"JSON: %@", jsonDict);
        
        NSMutableArray *result = [NSMutableArray array];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        
        NSArray *projects = [jsonDict objectForKey:@"projects"];
        for (int i=0; i<[projects count]; i++) {
            NSDictionary *dict = [projects objectAtIndex:i];
            
            RCProject *project = [[RCProject alloc] init];
            project.createdAt = [dateFormatter dateFromString:[dict valueForKey:@"created_on"]];
            project.updatedAt = [dateFormatter dateFromString:[dict valueForKey:@"updated_on"]];
            project.description = [dict valueForKey:@"description"];
            project.projectID = [NSNumber numberWithInt:[[dict valueForKey:@"id"] intValue]];
            project.identifier = [dict valueForKey:@"identifier"];
            project.name = [dict valueForKey:@"name"];
            
            [result addObject:project];
        }
        
        completion(result, nil);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"FAILURE: %@", error.localizedDescription);
        
        completion(nil, error);
    }];
    
    
    [operation start];
    
}

@end
