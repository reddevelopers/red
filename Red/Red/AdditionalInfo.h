//
//  AdditionalInfo.h
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <Parse/Parse.h>

@interface AdditionalInfo : PFObject <PFSubclassing>

@property(nonatomic, strong) NSString *userId;
@property(nonatomic, strong) NSString *eyes;
@property(nonatomic, strong) NSString *religion;
@property(nonatomic, strong) NSString *politics;
@property(nonatomic, strong) NSString *work;
@property(nonatomic, strong) NSString *hair;
@property(nonatomic, strong) NSString *bodyType;
@property(nonatomic, strong) NSString *education;
@property(nonatomic, strong) NSString *drink;
@property(nonatomic, strong) NSString *smoke;
@property(nonatomic, strong) NSString *exercise;
@property(nonatomic, strong) NSString *interests;
@property(nonatomic, strong) NSString *mySelfDescription;

+ (void) additionalInfoWithCompletion: (NSString *) objectId completion:(void (^)(AdditionalInfo *profile, NSError *))completion;


@end
