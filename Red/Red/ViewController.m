//
//  ViewController.m
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <ParseFacebookUtilsV4/ParseFacebookUtilsV4.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

#define MAIN_STORYBOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    UIButton *myLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    myLoginButton.backgroundColor=[UIColor darkGrayColor];
    myLoginButton.frame=CGRectMake(0,0,180,40);
    myLoginButton.center = self.view.center;
    [myLoginButton setTitle: @"My Login Button" forState: UIControlStateNormal];
    
    [myLoginButton
     addTarget:self
     action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:myLoginButton];
    
    
}


-(void)loginButtonClicked
{

    void (^sendRequestsBlock)(void) = ^{
        
        FBSDKGraphRequest *postRequest = nil;
        NSDictionary *parameters = [NSDictionary dictionaryWithObject:@"id,name,email,birthday,gender,location,picture" forKey:@"fields"];
        
        postRequest = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters HTTPMethod:@"GET"];
        [postRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
         {
             if (!error) {
                 NSDictionary *dictResult = (NSDictionary *)result;
                 
                 NSString *userId = [NSString stringWithFormat:@"%@", [dictResult objectForKey:@"id"]];
                 PFObject *profileData = [PFObject objectWithClassName:@"Profile"];
                 
                 profileData[@"id"] = userId;
                 profileData[@"name"] = [dictResult objectForKey:@"name"];
                 profileData[@"email"] = [dictResult objectForKey:@"email"];
                 NSString *birth = [dictResult objectForKey:@"birthday"];
                 if(birth.length >0){
                 profileData[@"birthday"] = [dictResult objectForKey:@"birthday"];
                 }
                 profileData[@"gender"] = [dictResult objectForKey:@"gender"];
                 
                 NSString *location = [dictResult objectForKey:@"location"];

                 NSString *profilePicture = [dictResult objectForKey:@"profilePicture"];
                 if(profilePicture.length >0){
                 profileData[@"profilePicture"] = [dictResult objectForKey:@"picture"][@"data"][@"url"];
                 }
                 
                 [profileData setObject:userId forKey:@"id"];
                 [profileData setObject:profileData[@"name"] forKey:@"name"];
                 [profileData setObject:profileData[@"email"] forKey:@"email"];
                 if(birth.length > 0){
                 [profileData setObject:profileData[@"birthday"] forKey:@"birthday"];
                 }
                 [profileData setObject:profileData[@"gender"] forKey:@"gender"];
                 if(profilePicture.length > 0){
                 [profileData setObject:profileData[@"profilePicture"] forKey:@"profilePicture"];
                 }
                 [profileData save];
                 
//                 [profileData saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                     if (succeeded) {
                         [[NSUserDefaults standardUserDefaults] setObject:profileData.objectId forKey:@"id"];
                           UINavigationController *nav = [MAIN_STORYBOARD instantiateViewControllerWithIdentifier:@"MainVC"];
                           nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                           [self presentViewController:nav animated:YES completion:nil];
//                     } else {
//                         // There was a problem, check error.description
//                     }
//                 }];
        
             }
         }];
        
        
    };
    
    
    /// login start
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];
    NSArray *permissions = [NSArray arrayWithObjects:@"email",@"public_profile", nil];
    
    [login logInWithReadPermissions:permissions fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            
        } else if (result.isCancelled) {
            
        } else {
            
            if ([result.grantedPermissions containsObject:@"email"]) {
                
                sendRequestsBlock();
                
            }
        }
    }];
    

}


- (void)_loginWithFacebook {
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[@"email",@"public_profile"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInInBackgroundWithReadPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if([PFUser currentUser]){
            UINavigationController *nav = [MAIN_STORYBOARD instantiateViewControllerWithIdentifier:@"ProfileVC"];
            nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:nav animated:YES completion:nil];
        }
        else if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
            UINavigationController *nav = [MAIN_STORYBOARD instantiateViewControllerWithIdentifier:@"MainVC"];
            nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:nav animated:YES completion:nil];
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
              UINavigationController *nav = [MAIN_STORYBOARD instantiateViewControllerWithIdentifier:@"MainVC"];
              nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
              [self presentViewController:nav animated:YES completion:nil];
        } else {
            NSLog(@"User logged in through Facebook!");
              UINavigationController *nav = [MAIN_STORYBOARD instantiateViewControllerWithIdentifier:@"MainVC"];
              nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
              [self presentViewController:nav animated:YES completion:nil];
        }
    }];
}


@end
