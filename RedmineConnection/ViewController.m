//
//  ViewController.m
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 09.12.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import "ViewController.h"
#import "RCSettings.h"
#import "NSObject+AutoMagicCoding.h"

#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

#import "RCProject.h"
#import "RCIssue.h"
#import "RCIssueStatus.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    RCProject *p = [[RCProject alloc] init];
    p.projectID = [NSNumber numberWithInt:16];
    
    RCIssueStatus *status = [[RCIssueStatus alloc]init];
    status.statusID = [NSNumber numberWithInt:1];
    
    RCIssue *issue = [[RCIssue alloc] init];
    issue.subject = @"Test issue subject";
    issue.description = @"Test issue description";
    issue.project = p;
    issue.status = status;
        
    [issue postWitherrorHandler:^(NSError *error) {
        if (error) {
            NSLog(@"ERROR: %@", error.localizedDescription);
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
