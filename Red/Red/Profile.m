//
//  Profile.m
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "Profile.h"

@implementation Profile

@dynamic userId, name, email, birthday, gender, location, profilePicture;

#pragma mark - Parse

+ (void)load {
    // Required to register the sub class with Parse
    [self registerSubclass];
}

+ (NSString *)parseClassName {
   
    return @"Profile";
}

+ (PFQuery *)query {
    PFQuery *query = [super query];
    
    [query includeKey:@"id"];
    [query includeKey:@"name"];
     [query includeKey:@"email"];
     [query includeKey:@"birthday"];
     [query includeKey:@"gender"];
     [query includeKey:@"location"];
     [query includeKey:@"profilePicture"];
    
    query.cachePolicy = kPFCachePolicyNetworkElseCache;
    
    return query;
}

+ (Profile *) createWithDict:(PFObject *)data
{
    Profile *item = [[Profile alloc] init];
    NSLog(@"The item1 is %@", item);
    item = (Profile *)data;
    NSLog(@"The item2 is %@", item);
//    }
    
    return item;
}

+ (void) profileWithCompletion: (NSString *) objectId completion:(void (^)(Profile *profile, NSError *))completion
{
    PFQuery *query = [PFQuery queryWithClassName:@"Profile"];
    [query getObjectInBackgroundWithId:objectId block:^(PFObject *profileData, NSError *error){
        if (!error)
        {
            completion([Profile createWithDict:profileData], nil);
            
        }
    }];
}

@end
