//
//  BoardViewController.h
//  fTTT
//
//  Created by Nathan Walker on 4/11/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoardViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *squares;

- (IBAction)touchSquare:(id)sender;

@end
