//
//  SendActionViewController.h
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendActionViewController : UIViewController <UITextViewDelegate>


@property(nonatomic, strong) IBOutlet UILabel *actionLabel;
@property(nonatomic, strong) IBOutlet UILabel *actionDescriptionLabel;
@property(nonatomic, weak) IBOutlet UIImageView *actionPicture;


@property(nonatomic, strong) NSString *actionStr;
@property(nonatomic, strong) NSString *actionDescriptionStr;
@property(nonatomic, weak) NSString *actionPictureStr;

@property(nonatomic, strong) NSMutableArray *myImages;

@property(nonatomic, weak) NSIndexPath *myIndex;

@property(nonatomic, strong) IBOutlet UITextView *sendActionDescriptionLabel;

@end
