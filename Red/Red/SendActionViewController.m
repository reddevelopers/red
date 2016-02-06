//
//  SendActionViewController.m
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "SendActionViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Actions.h"

@interface SendActionViewController ()

@end

@implementation SendActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.actionLabel.text = self.actionStr;
    self.actionDescriptionLabel.text = self.actionDescriptionStr;
    
    self.myImages= [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed: @"action-wink"],[UIImage imageNamed: @"action-wanna-chat"],[UIImage imageNamed:@"action-wanna-grab-a-drink"], [UIImage imageNamed:@"action-wanna-meet-over-lunch"], [UIImage imageNamed:@"action-will-you-have-dinner-with-me"], [UIImage imageNamed:@"action-would-love-to-meet-you"], [UIImage imageNamed:@"action-when-can-we-meet"], nil];
    
    self.actionPicture.image = self.myImages[self.myIndex.row];
    
    
}


- (void)textViewDidChange:(UITextView *)textView
{
    
    if ([[textView.text substringWithRange:NSMakeRange(textView.text.length - 1, 1)] isEqualToString:@"\n"]) {
        {
            [textView resignFirstResponder];
            [self postActionMessage: textView.text];
        }
    }
}

-(void)postActionMessage :(NSString *)messageStr {
   
    NSString *objectId = [[NSUserDefaults standardUserDefaults] objectForKey:@"id"];
    [Actions submitActionWithCompletion:objectId action:self.actionStr actionDescription:self.actionDescriptionStr image:self.actionPicture.image completion:^(Actions *result, NSError *error) {
        if(error)
        {
            NSLog(@"%@", error);
            
            return;
        }
        else {
            NSLog(@"Saved successFully");
        }
        
       // [self setUI:result];
    }];
}

@end
