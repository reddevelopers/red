//
//  LoveHappensTableViewCell.m
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import "LoveHappensTableViewCell.h"

@implementation LoveHappensTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) loadData : (NSDictionary *) myData indexPath:(NSInteger)rowIndex{
    NSLog(@"The myData is %@", myData);
    selectedRowIndex = (int)rowIndex;
   // self.collectionTitle.text = recommendCollectionData[@"_embedded"][@"item"][@"title"];
    self.descriptionLabel.text = myData[@"mySelfDescription"];
}

-(IBAction)sendAction:(id)sender {
    [self.delegate sendAction:@"Hello" indexPath:selectedRowIndex];
    
}

@end
