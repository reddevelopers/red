//
//  Profile.h
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <Parse/Parse.h>

@interface Profile : PFObject <PFSubclassing>

@property(nonatomic, strong) NSString *userId;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *birthday;
@property(nonatomic, strong) NSString *gender;
@property(nonatomic, strong) NSString *location;
@property(nonatomic, strong) NSString *profilePicture;

+ (void) profileWithCompletion: (NSString *) objectId completion:(void (^)(Profile *profile, NSError *))completion;


@end
