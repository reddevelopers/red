//
//  ActionChoiceTableViewCell.h
//  Red
//
//  Created by Amirul Islam on 1/23/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionChoiceTableViewCell : UITableViewCell

@property(nonatomic, strong) IBOutlet UILabel *actionLabel;
@property(nonatomic, strong) IBOutlet UILabel *actionDescriptionLabel;
@property(nonatomic, weak) IBOutlet UIImageView *actionPicture;

@end
