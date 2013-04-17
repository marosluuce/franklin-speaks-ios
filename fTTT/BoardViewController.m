//
//  BoardViewController.m
//  fTTT
//
//  Created by Nathan Walker on 4/11/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "BoardViewController.h"

@interface BoardViewController ()

@end

@implementation BoardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      NSURL *url = [NSURL URLWithString:@"http://localhost:5000"];
      HttpConnector *connector = [[HttpConnector alloc] init];
      ServerCommunicator *communicator = [[ServerCommunicator alloc] initWithUrl:url andWithConnector:connector];
      self.game = [[TicTacToe alloc] initWithCommunicator:communicator];
    }
  
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchSquare:(id)sender {
  id <Square> square = [[BoardSquare alloc] initWithButton:sender];
  [self.game updateSquare:square];
  [self.game updateView:self];
}

- (void)alertGameOver {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                  message:[self.game gameOverMessage]
                                                 delegate:nil
                                        cancelButtonTitle:@"Ok"
                                        otherButtonTitles:nil];
  
  [alert show];
}

@end
