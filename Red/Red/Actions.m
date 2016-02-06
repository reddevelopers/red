//
//  Actions.m
//  Red
//
//  Created by Amirul Islam on 1/23/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "Actions.h"

@implementation Actions

@dynamic action, actionDescription, actionPicture;

+ (void)load {
    // Required to register the sub class with Parse
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    
    return @"Actions";
}

//+ (PFQuery *)query {
//    PFQuery *query = [super query];
//    
//    [query includeKey:@"id"];
//    [query includeKey:@"name"];
//    [query includeKey:@"email"];
//    [query includeKey:@"birthday"];
//    [query includeKey:@"gender"];
//    [query includeKey:@"location"];
//    [query includeKey:@"profilePicture"];
//    
//    query.cachePolicy = kPFCachePolicyNetworkElseCache;
//    
//    return query;
//}

+ (Actions *) createWithDict:(PFObject *)data
{
    Actions *item = [[Actions alloc] init];
    NSLog(@"The item1 is %@", item);

    item = (Actions *)data;
    NSLog(@"The item2 is %@", item);
    //    }
    
    return item;
}

+ (void) submitActionWithCompletion: (NSString *) objectId action: (NSString *) action actionDescription: (NSString *) actionDescription  image: (UIImage *) imageView completion:(void (^)(Actions *profile, NSError *))completion
{
    NSData* data = UIImageJPEGRepresentation(imageView, 0.5f);
    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:data];
    
    PFObject *query = [PFObject objectWithClassName:@"Actions"];

    [query setObject:objectId forKey:@"id"];
    [query setObject:action forKey:@"action"];
    [query setObject:actionDescription forKey:@"actionDescription"];
    [query setObject:imageFile forKey:@"image"];
    
    [query saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded)
        {
           NSLog(@"Saved successFully");
            
        }
        else {
            NSLog(@"There is an error");
        }
    }];
}



@end
