//
//  ProfileViewController.m
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "ProfileViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <ParseFacebookUtilsV4/ParseFacebookUtilsV4.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Parse/Parse.h>
#import "Profile.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "AdditionalInfo.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize scroll_view, panel, keyboard_h;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [scroll_view addSubview:panel];
    
    scroll_view.contentOffset = CGPointMake(0, 0);
    
    [self _loadData];
    
   // [self fetchWithCompletion];
}

-(IBAction)myHistory:(id)sender {
    
    UINavigationController *nav = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MyHistoryVC"];
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:nil];
}


- (void)_loadData {
    
    NSString *objectId = @"WLtL0MYRYT";
    //NSString *objectId = [[NSUserDefaults standardUserDefaults] objectForKey:@"id"];
    [Profile profileWithCompletion:objectId completion:^(Profile *result, NSError *error) {
        if(error)
        {
            NSLog(@"%@", error);
            
            return;
        }
        
        
        [self setupUI:result];
        //[self fetchWithCompletion];
       
    }];
    
}

-(void) setupUI: (Profile *) profile {
    
    self.nameLabel.text = profile.name;
    self.ageLabel.text = profile.birthday;
    
    [self.profilePicture sd_setImageWithURL:[NSURL URLWithString:profile.profilePicture] placeholderImage:[UIImage imageNamed:@"defaultArticleImage"]];
    NSLog(@"Object id %@",[profile objectId]);
    
    [[NSUserDefaults standardUserDefaults] setObject:[profile objectId] forKey:@"id"];
    [[NSUserDefaults standardUserDefaults] setObject:profile.name forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:profile.email forKey:@"email"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self textFieldDisabled];
    
    [self fetchWithCompletion];

}

//-(IBAction)saveAdditionalInfo:(id)sender {
//    if([self.saveButton.titleLabel.text isEqualToString:@"SAVE"]){
//    NSString *uuid = [[NSUserDefaults standardUserDefaults] objectForKey:@"id"];
//        
//    PFObject *additionalInfoData = [PFObject objectWithClassName:@"AdditionalInfo"];
//    
//    [additionalInfoData setObject:uuid forKey:@"id"];
//    [additionalInfoData setObject:self.mySelfDescriptionLabel.text forKey:@"mySelfDescription"];
//    [additionalInfoData setObject:self.interestsLabel.text forKey:@"interests"];
//    [additionalInfoData setObject:self.eyesLabel.text forKey:@"eyes"];
//    [additionalInfoData setObject:self.religionLabel.text forKey:@"religion"];
//    [additionalInfoData setObject:self.politicsLabel.text forKey:@"politics"];
//    [additionalInfoData setObject:self.workLabel.text forKey:@"work"];
//    [additionalInfoData setObject:self.hairLabel.text forKey:@"hair"];
//    [additionalInfoData setObject:self.bodyTypeLabel.text forKey:@"bodyType"];
//    [additionalInfoData setObject:self.educationLabel.text forKey:@"education"];
//    [additionalInfoData setObject:self.drinkLabel.text forKey:@"drink"];
//    [additionalInfoData setObject:self.smokeLabel.text forKey:@"smoke"];
//    [additionalInfoData setObject:self.exerciseLabel.text forKey:@"exercise"];
//    
//    
//    
//    [additionalInfoData saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//    if (succeeded) {
// 
//        [self textFieldDisabled];
//        [self.saveButton setTitle:@"EDIT" forState:UIControlStateNormal];
//
//    } else {
//                // There was a problem, check error.description
//            }
//    }];
//    }
//    else{
//        [self.saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
//        [self textFieldEnabled];
//    }
//}

-(IBAction)saveAdditionalInfo:(id)sender {
    if([self.saveButton.titleLabel.text isEqualToString:@"SAVE"]){
       // NSString *uuid = [[NSUserDefaults standardUserDefaults] objectForKey:@"id"];
        
        NSString *uuid = [[NSUserDefaults standardUserDefaults] objectForKey:@"objectId"];
        
        
        PFQuery *additionalInfoData1 = [PFQuery queryWithClassName:@"AdditionalInfo"];
        [additionalInfoData1 getObjectInBackgroundWithId:@"DveKMzPBir" block:^(PFObject *additionalInfoData, NSError *error) {
            
        [additionalInfoData setObject:uuid forKey:@"id"];
        [additionalInfoData setObject:self.mySelfDescriptionLabel.text forKey:@"mySelfDescription"];
        [additionalInfoData setObject:self.interestsLabel.text forKey:@"interests"];
        [additionalInfoData setObject:self.eyesLabel.text forKey:@"eyes"];
        [additionalInfoData setObject:self.religionLabel.text forKey:@"religion"];
        [additionalInfoData setObject:self.politicsLabel.text forKey:@"politics"];
        [additionalInfoData setObject:self.workLabel.text forKey:@"work"];
        [additionalInfoData setObject:self.hairLabel.text forKey:@"hair"];
        [additionalInfoData setObject:self.bodyTypeLabel.text forKey:@"bodyType"];
        [additionalInfoData setObject:self.educationLabel.text forKey:@"education"];
        [additionalInfoData setObject:self.drinkLabel.text forKey:@"drink"];
        [additionalInfoData setObject:self.smokeLabel.text forKey:@"smoke"];
        [additionalInfoData setObject:self.exerciseLabel.text forKey:@"exercise"];
        
        
            [additionalInfoData saveInBackground];
        }];
    }
    else{
        [self.saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
        [self textFieldEnabled];
    }
}



- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGRect rect = [info[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboard_h = rect.size.height; //UIDeviceOrientationIsLandscape(self.interfaceOrientation) ? rect.size.width : rect.size.height;
    [self refresh_layout];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    keyboard_h = 0;
    [self refresh_layout];
}


- (void)refresh_layout {

    
}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = textField.frame.origin.y / 2+ 10;
    const float movementDuration = 0.3f;
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(void) textFieldEnabled {
    
    self.eyesLabel.enabled = YES;
    self.religionLabel.enabled = YES;
    self.politicsLabel.enabled = YES;
    self.workLabel.enabled = YES;
    self.hairLabel.enabled = YES;
    self.bodyTypeLabel.enabled = YES;
    self.educationLabel.enabled = YES;
    self.drinkLabel.enabled = YES;
    self.smokeLabel.enabled = YES;
    self.exerciseLabel.enabled = YES;
    self.interestsLabel.enabled = YES;
    self.mySelfDescriptionLabel.editable = YES;
}

-(void) textFieldDisabled {
    
    self.eyesLabel.enabled = NO;
    self.religionLabel.enabled = NO;
    self.politicsLabel.enabled = NO;
    self.workLabel.enabled = NO;
    self.hairLabel.enabled = NO;
    self.bodyTypeLabel.enabled = NO;
    self.educationLabel.enabled = NO;
    self.drinkLabel.enabled = NO;
    self.smokeLabel.enabled = NO;
    self.exerciseLabel.enabled = NO;
    self.interestsLabel.enabled = NO;
    self.mySelfDescriptionLabel.editable = NO;
}


-(void) fetchWithCompletion
{
    
   // NSString *objectId = @"DveKMzPBir";
    NSString *objectId = [[NSUserDefaults standardUserDefaults] objectForKey:@"id"];
    [AdditionalInfo additionalInfoWithCompletion:objectId completion:^(AdditionalInfo *result, NSError *error) {
        if(error)
        {
            NSLog(@"%@", error);
            
            return;
        }
        
        
        [self setUI:result];
    }];
    
}


-(void) setUI: (AdditionalInfo *) profile {
    
    self.eyesLabel.text = profile.eyes;
    self.exerciseLabel.text = profile.exercise;

    self.religionLabel.text = profile.religion;
    self.politicsLabel.text = profile.politics;
    self.workLabel.text = profile.work;
    self.hairLabel.text = profile.hair;
    self.bodyTypeLabel.text = profile.bodyType;
    self.educationLabel.text = profile.education;
    self.drinkLabel.text = profile.drink;
    self.smokeLabel.text = profile.smoke;
    self.interestsLabel.text = profile.interests;
    self.mySelfDescriptionLabel.text = profile.mySelfDescription;
    
    [self textFieldDisabled];
}

@end
