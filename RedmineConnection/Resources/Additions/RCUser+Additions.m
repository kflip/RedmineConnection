//
//  RCUser+Additions.m
//  RedmineConnection
//
//  Created by Sebastian Kruschwitz on 19.12.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import "RCUser+Additions.h"
#import "RCSettings.h"

#import "AFJSONRequestOperation.h"

@implementation RCUser (Additions)

+(void)userWithID:(int)ID completion:(void (^)(RCUser *user, NSError *error))completion {
    RCSettings *settings = [RCSettings sharedInstance];
    NSString *urlString = [NSString stringWithFormat:@"%@users/%i.json?key=%@", settings.serverURL, ID, settings.apiKey];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        
        NSDictionary *dict = [(NSDictionary*)JSON objectForKey:@"user"];
        RCUser *user = [RCUser MR_createEntity];
        user.lastname = [dict valueForKey:@"lastname"];
        user.userID = [dict valueForKey:@"id"];
        user.mail = [dict valueForKey:@"mail"];
        user.firstname = [dict valueForKey:@"firstname"];
        user.login = [dict valueForKey:@"login"];
        
        completion(user, nil);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        completion(nil, error);
    }];
    
    
    [operation start];
}
@end
