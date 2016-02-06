//
//  ActionChoiceViewController.h
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionChoiceViewController : UIViewController

@property(nonatomic, strong) NSMutableArray *myAction;
@property(nonatomic, strong) NSMutableArray *descriptionAction;
@property(nonatomic, strong) NSMutableArray *myImages;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
