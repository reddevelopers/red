//
//  LoveHappensViewController.m
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "LoveHappensViewController.h"
#import "LoveHappensTableViewCell.h"
#import "AdditionalInfo.h"

@interface LoveHappensViewController ()

@end

@implementation LoveHappensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSBundle* bundle = [NSBundle bundleForClass:self.class];
    
    UINib* noDataAvailableCellNib = [UINib nibWithNibName:@"LoveHappensTableViewCell" bundle:bundle];
    [self.tableView registerNib:noDataAvailableCellNib forCellReuseIdentifier:@"LoveHappensTableViewCell"];
    
    [self fetchWithCompletion];
    
}


-(void) fetchWithCompletion
{
    
    
    NSMutableArray *allObjects = [NSMutableArray array];
    PFQuery *query = [PFQuery queryWithClassName:@"AdditionalInfo"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [allObjects addObjectsFromArray:objects];
            self.myData = allObjects;
            NSLog(@"self.myData: %@", self.myData);
             [self.tableView reloadData];
            
                 } else {
                     NSLog(@"Error: %@ %@", error, [error userInfo]);
                 }
                 }];
    
}



#pragma mark - UITableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myData.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

        LoveHappensTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoveHappensTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        //[cell loadNotification:[self.notification objectAtIndex:indexPath.row]];
    [cell loadData:[self.myData objectAtIndex:indexPath.row] indexPath: indexPath.row];
    
        return cell;

}


-(void) sendAction : (NSString *) collectionId indexPath:(int)rowIndex {
    
    UINavigationController *nav = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ActionChoiceVC"];
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:nil];
}

@end
