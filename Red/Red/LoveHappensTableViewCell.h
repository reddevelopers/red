//
//  LoveHappensTableViewCell.h
//  Red
//
//  Created by Amirul Islam on 1/3/16.
//  Copyright © 2016 Amirul Islam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoveHappensTableVieDelegate <NSObject>

-(void) sendAction : (NSString *) collectionId indexPath:(int)rowIndex;

@end

@interface LoveHappensTableViewCell : UITableViewCell {
    
     int selectedRowIndex;
}

@property(nonatomic, strong) IBOutlet UILabel *descriptionLabel;
@property(nonatomic, weak) IBOutlet UIImageView *profilePicture;
@property (nonatomic, weak) id<LoveHappensTableVieDelegate> delegate;

-(void) loadData : (NSDictionary *) myData indexPath:(NSInteger)rowIndex;
-(IBAction)sendAction:(id)sender;

@end
