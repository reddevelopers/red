//
//  AppDelegate.m
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <Parse/Parse.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <ParseFacebookUtilsV4/ParseFacebookUtilsV4.h>
#import "Profile.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Parse enableLocalDatastore];
    
    [Parse setApplicationId:@"rMxj2x3tdtFb6UZKLkONBtYoerx2NQsWGH1IiYOP" clientKey:@"ZqdMSxG6JYHwIaGdQ6cbCpXY9gEABiw17ghX8NDF"];

    
    [PFFacebookUtils initializeFacebookWithApplicationLaunchOptions:launchOptions];

    [self sessionStart];
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];

}

/*
- (void) startSession
{
//    NSString *objectId = [[NSUserDefaults standardUserDefaults] objectForKey:@"id"];
//    
//    if(objectId.length > 0){
//    
//    [Profile profileWithCompletion:objectId completion:^(Profile *result, NSError *error) {
//        if(error)
//        {
//            NSLog(@"%@", error);
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//            UIViewController* rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainVC"];
//            self.window.rootViewController = rootViewController;
//            [self.window makeKeyAndVisible];
//            
//            return;
//        }
//        else {
//            
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//            UIViewController* rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileVC"];
//            self.window.rootViewController = rootViewController;
//            [self.window makeKeyAndVisible];
//        }
//        
//        
//        
//    }];
//        
//    }
//    else{
//        return;
//    }
       //User is logged in. Push the Main screen
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController* rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainVC"];
        self.window.rootViewController = rootViewController;
        [self.window makeKeyAndVisible];
    
}
*/


-(void)sessionStart{
    
    if ([FBSDKAccessToken currentAccessToken] != nil) {
        NSLog(@"FB user id name");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController* rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewVC"];
        self.window.rootViewController = rootViewController;
        [self.window makeKeyAndVisible];
    }
    else{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController* rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainVC"];
        
        self.window.rootViewController = rootViewController;
        [self.window makeKeyAndVisible];
        
    }
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
    
}


@end
