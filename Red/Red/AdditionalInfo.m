//
//  AdditionalInfo.m
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "AdditionalInfo.h"

@implementation AdditionalInfo

@dynamic userId, eyes, religion, politics, work, hair, bodyType, education, drink, smoke, exercise, interests, mySelfDescription;


#pragma mark - Parse

+ (void)load {
    // Required to register the sub class with Parse
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    
    return @"AdditionalInfo";
}


+ (AdditionalInfo *) createWithDict:(PFObject *)data
{
    AdditionalInfo *item = [[AdditionalInfo alloc] init];
    item = (AdditionalInfo *)data;
    return item;
}

+ (void) additionalInfoWithCompletion: (NSString *) objectId completion:(void (^)(AdditionalInfo *profile, NSError *))completion
{
    PFQuery *query = [PFQuery queryWithClassName:@"AdditionalInfo"];
    //[query whereKey:@"id" notEqualTo:objectId];
   // [query getObjectInBackgroundWithId:objectId block:^(PFObject *profileData, NSError *error){
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            //completion([AdditionalInfo createWithDict:objects], nil);
//            for (PFObject *object in objects) {
//                NSLog(@"%@", object.objectId);
//                NSArray * testArray = [[object objectAtIndex:0] objectForKey:@"winners"];
//            }
            
            for(int i=0; i<objects.count; i++){
                 PFObject * object = [objects objectAtIndex:i];
                if([[[objects objectAtIndex:i] objectForKey:@"id"] isEqualToString:objectId]) {
                    NSLog(@"%@", object.objectId);
                    [[NSUserDefaults standardUserDefaults] setObject:object.objectId forKey:@"objectId"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    completion([AdditionalInfo createWithDict:object], nil);
                    
                }
                
            }
            
            
            
        }
        else{
            NSLog(@"The error is %@", error);
        }
    }];
}


@end
