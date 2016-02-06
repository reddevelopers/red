//
//  LoveHappensViewController.m
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "LoveHappensViewController.h"
#import "LoveHappensTableViewCell.h"

@interface LoveHappensViewController ()

@end

@implementation LoveHappensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSBundle* bundle = [NSBundle bundleForClass:self.class];
    
    UINib* noDataAvailableCellNib = [UINib nibWithNibName:@"LoveHappensTableViewCell" bundle:bundle];
    [self.tableView registerNib:noDataAvailableCellNib forCellReuseIdentifier:@"LoveHappensTableViewCell"];
    
}

#pragma mark - UITableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

        LoveHappensTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoveHappensTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
     //   cell.delegate = self;
        //[cell loadNotification:[self.notification objectAtIndex:indexPath.row]];
        
        return cell;

}

@end
