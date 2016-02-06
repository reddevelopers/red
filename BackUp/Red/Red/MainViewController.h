//
//  MainViewController.h
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *profileBtn;
@property (nonatomic, strong) IBOutlet UIButton *loveBtn;
@property (nonatomic, strong) IBOutlet UIButton *interestBtn;

-(IBAction)loadProfile:(id)sender;
-(IBAction)loadLoveHappens:(id)sender;
-(IBAction)loadInterests:(id)sender;


@end
