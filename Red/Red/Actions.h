//
//  Actions.h
//  Red
//
//  Created by Amirul Islam on 1/23/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <Parse/Parse.h>

@interface Actions : PFObject <PFSubclassing>

@property(nonatomic, strong) NSString *action;
@property(nonatomic, strong) NSString *actionDescription;
@property(nonatomic, strong) NSString *actionPicture;


+ (void) submitActionWithCompletion: (NSString *) objectId action: (NSString *) action actionDescription: (NSString *) actionDescription  image: (UIImage *) imageView completion:(void (^)(Actions *profile, NSError *))completion;

@end
