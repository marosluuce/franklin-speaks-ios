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
      self.interactor = [TicTacToeInteractor newInteractorWithGame:self];
    }
  
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.squares = [self buttonsToSquares:self.buttons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchSquare:(id)sender {
  [self.interactor doMove:[sender tag] withView:self];
}

- (void)alertGameOver {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                  message:[self.interactor gameOverMessage]
                                                 delegate:self
                                        cancelButtonTitle:@"New Game"
                                        otherButtonTitles:nil];
  
  [alert show];
}

- (NSArray *)buttonsToSquares:(NSArray *)buttons {
  NSMutableArray *squares = [[NSMutableArray alloc] init];
  
  for (id button in buttons) {
    id <Square> square = [[BoardSquare alloc] initWithButton:button];
    [squares addObject:square];
  }
  
  return squares;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  [self.interactor newGame:self];
}

@end
