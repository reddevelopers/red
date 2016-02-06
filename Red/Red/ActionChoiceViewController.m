//
//  ActionChoiceViewController.m
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "ActionChoiceViewController.h"
#import "ActionChoiceTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "SendActionViewController.h"

@interface ActionChoiceViewController ()

@end

@implementation ActionChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.myAction = [[NSMutableArray alloc ]initWithObjects:@"wink",@"wanna chat?",@"wanna grab a drink?", @"wanna meet over lunch?", @"will you have dinner with me?", @"would love to meet you!", @"when can we meet?", nil];
    
    self.descriptionAction = [[NSMutableArray alloc ]initWithObjects:@"be flirty",@"try messaging first",@"set place and time", @"set place and time", @"set place and time", @"set place and time", @"set place and time", nil];
    
    self.myImages= [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed: @"action-wink"],[UIImage imageNamed: @"action-wanna-chat"],[UIImage imageNamed:@"action-wanna-grab-a-drink"], [UIImage imageNamed:@"action-wanna-meet-over-lunch"], [UIImage imageNamed:@"action-will-you-have-dinner-with-me"], [UIImage imageNamed:@"action-would-love-to-meet-you"], [UIImage imageNamed:@"action-when-can-we-meet"], nil];

    NSBundle* bundle = [NSBundle bundleForClass:self.class];
    
    UINib* actionChoiceTableViewCellNib = [UINib nibWithNibName:@"ActionChoiceTableViewCell" bundle:bundle];
    [self.tableView registerNib:actionChoiceTableViewCellNib forCellReuseIdentifier:@"ActionChoiceTableViewCell"];
    
    
}

#pragma mark - UITableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ActionChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActionChoiceTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.delegate = self;
    cell.actionLabel.text = [self.myAction objectAtIndex:indexPath.row];
    cell.actionDescriptionLabel.text = [self.descriptionAction objectAtIndex:indexPath.row];
    cell.actionPicture.image = self.myImages[indexPath.row];

    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SendActionViewController *nav = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SendActionVC"];
    nav.actionStr = [self.myAction objectAtIndex:indexPath.row];
    nav.actionDescriptionStr = [self.descriptionAction objectAtIndex:indexPath.row];
    nav.actionPictureStr = self.myImages[indexPath.row];
    nav.myIndex = indexPath;
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController: nav animated:YES completion:nil];
}
@end
