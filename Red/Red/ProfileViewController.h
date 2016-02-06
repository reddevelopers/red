//
//  ProfileViewController.h
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>

@property(nonatomic, strong) IBOutlet UILabel *nameLabel;
@property(nonatomic, strong) IBOutlet UILabel *ageLabel;
@property(nonatomic, weak) IBOutlet UIImageView *profilePicture;

//@property(nonatomic, strong) NSString *userId;
@property(nonatomic, strong) IBOutlet UITextField *eyesLabel;
@property(nonatomic, strong) IBOutlet UITextField *religionLabel;
@property(nonatomic, strong) IBOutlet UITextField *politicsLabel;
@property(nonatomic, strong) IBOutlet UITextField *workLabel;
@property(nonatomic, strong) IBOutlet UITextField *hairLabel;
@property(nonatomic, strong) IBOutlet UITextField *bodyTypeLabel;
@property(nonatomic, strong) IBOutlet UITextField *educationLabel;
@property(nonatomic, strong) IBOutlet UITextField *drinkLabel;
@property(nonatomic, strong) IBOutlet UITextField *smokeLabel;
@property(nonatomic, strong) IBOutlet UITextField *exerciseLabel;
@property(nonatomic, strong) IBOutlet UITextField *interestsLabel;
@property(nonatomic, strong) IBOutlet UITextView *mySelfDescriptionLabel;

@property (nonatomic, retain) IBOutlet UIScrollView *scroll_view;
@property (nonatomic, retain) IBOutlet UIView *panel;
@property NSInteger keyboard_h;

@property(nonatomic, strong) IBOutlet UIButton *saveButton;

-(IBAction)myHistory:(id)sender;
-(IBAction)saveAdditionalInfo:(id)sender;

@end
