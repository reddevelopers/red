//
//  LoveHappensViewController.h
//  Red
//
//  Created by Amirul Islam on 1/1/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoveHappensTableViewCell.h"

@interface LoveHappensViewController : UIViewController <LoveHappensTableVieDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *myData;


@end
