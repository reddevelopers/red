//
//  MainViewController.m
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) UIViewController* currentVC;
@property (strong, nonatomic) NSString* currentVCName;
@property (strong, nonatomic) NSMutableDictionary* loadedViewController;

@end

#define MAIN_STORYBOARD [UIStoryboard storyboardWithName:@"Main" bundle:nil]

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadViewControllers:@"ProfileVC"];
}

-(IBAction)loadProfile:(id)sender {
    [self loadViewControllers:@"ProfileVC"];
    
}

-(IBAction)loadLoveHappens:(id)sender{
    [self loadViewControllers:@"LoveHappensVC"];
    
    
}

-(IBAction)loadInterests:(id)sender {
    [self loadViewControllers:@"InterestsVC"];
    
    
}


-(void)loadViewControllers:(NSString*)viewControllerName
{
    UIViewController* viewController = [self.loadedViewController objectForKey:viewControllerName];
    
    
    if (!viewController)
    {
        if([viewControllerName isEqualToString:@"ProfileVC"]){
            viewController = [MAIN_STORYBOARD instantiateViewControllerWithIdentifier:@"ProfileVC"];
        }
        else if([viewControllerName isEqualToString:@"LoveHappensVC"]){
            viewController = [MAIN_STORYBOARD instantiateViewControllerWithIdentifier:@"LoveHappensVC"];
        }
        else if([viewControllerName isEqualToString:@"InterestsVC"]){
            viewController = [MAIN_STORYBOARD instantiateViewControllerWithIdentifier:@"InterestsVC"];
        }
        else {
            return;
        }
    }
    
    [self addChildViewController:viewController];
    
    [self.currentVC.view removeFromSuperview];
    [viewController.view setFrame:self.view.bounds];
    [self.view addSubview:viewController.view];
    [self.view sendSubviewToBack:viewController.view];
    self.currentVC = viewController;
    self.currentVCName = viewControllerName;
}



@end
