//
//  NewGameViewController.m
//  fTTT
//
//  Created by Nathan Walker on 5/2/13.
//  Copyright (c) 2013 Nathan Walker. All rights reserved.
//

#import "NewGameViewController.h"

@interface NewGameViewController ()

@end

@implementation NewGameViewController

- (id)initControllerAndInteractor {
  self = [super initWithNibName:@"NewGameViewController" bundle:nil];
  if (self) {
    self.board = [[BoardViewController alloc] initWithNibName:@"BoardViewController" bundle:NULL];
    self.interactor = [TicTacToeInteractor newInteractorWithGame:self.board];
  }
  return self;
}

- (id)initWithInteractor:(TicTacToeInteractor *)interactor {
  self = [super initWithNibName:@"NewGameViewController" bundle:nil];
  if (self) {
    self.interactor = interactor;
  }
  return self;
}

- (void)newGameWithOpponent:(NSString *)opponent {
  [self.interactor newGame:opponent];
//  [self dismissViewControllerAnimated:YES completion:NULL];
  [self presentViewController:self.board animated:YES completion:NULL];
}

- (IBAction)newGameWithHuman:(id)sender {
  [self newGameWithOpponent:@"human"];
}

- (IBAction)newGameWithEasyAI:(id)sender {
  [self newGameWithOpponent:@"easy_ai"];
}

- (IBAction)newGameWithHardAI:(id)sender {
  [self newGameWithOpponent:@"hard_ai"];
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

@end
