//
//  ViewController.m
//  TicTacToe
//
//  Created by Jose Colella on 21/03/2014.
//  Copyright (c) 2014 Jose Colella. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.state = @"X";
    self.image = [UIImage imageNamed:@"x"];
    
    self.rowVictoryMoves = @[@[@0, @1, @2],
                             @[@3, @4, @5],
                             @[@6, @7, @8]
                             ];
    
    self.columnVictoryMoves = @[@[@0, @3, @6],
                                @[@1, @4, @7],
                                @[@2, @5, @8]
                                ];
    self.diagonalVictoryMoves = @[@[@0, @4, @8],
                                  @[@2, @4, @6],
                                  ];
    
    self.xMovesArray = [NSMutableArray array];
    self.oMovesArray = [NSMutableArray array];
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *
 */
- (void)changeState {
    if ([self.state isEqualToString:@"X"]) {
        self.state = @"O";
        self.image = [UIImage imageNamed:@"o"];
    } else {
        self.state = @"X";
        self.image = [UIImage imageNamed:@"x"];
    }
}



/**
 * This method restarts the view, eliminating all images that have been set
 * by the previous game. Shows an UIAlertView to indicate which user has won.
 *
 * @param winner The string of the player who has won
 *
 */
- (void) startNewGame:(NSString *)winner {
    
    self.firstCell.image = nil;
    self.secondCell.image = nil;
    self.thirdCell.image = nil;
    self.fourthCell.image = nil;
    self.fifthCell.image = nil;
    self.sixthCell.image = nil;
    self.seventhCell.image = nil;
    self.eightCell.image = nil;
    self.ninthCell.image = nil;
    
    [self showVictoryAlertView:winner];
    [self viewDidLoad];
    
}

/**
 * This method checks for the conditions of victory
 * in the array of moves made by the player. The conditions
 * for victory are to check diagonal, vertical, and horizontal moves
 *
 * \param playerArray The array of player moves
 * \returns A boolean that determines if all the victory conditions are verified.
 */
- (BOOL) checkConditionArray:(NSArray *)conditionArray forArray:(NSArray *)playerArray; {
    
    BOOL isConditionMet = false;
    
    if ([playerArray count] >= 3) {
        for (NSArray * row in conditionArray) {
            NSInteger containsCount = 0;
            for (NSNumber *cell in row) {
                if ([playerArray containsObject:cell]) {
                    containsCount++;
                } else {
                    break;
                }
                
            }
            if (containsCount == 3) {
                isConditionMet = true;
                break;
            }
            
        }
        
    }
    
    return isConditionMet;
    
}


/**
 *  This method checks if the conditions for victory by either player have been met
 *
 *  @param xArray The array by the X player
 *  @param oArray The array by the O
 *
 *  @return NSString winner The string that determines the winner
 */
- (NSString *) winner:(NSArray *)xArray :(NSArray *)oArray {
    
    NSString * winner = nil;

    
    BOOL isPlayer1Condition1Met = [self checkConditionArray:self.columnVictoryMoves forArray:xArray];
    BOOL isPlayer2Condition1Met = [self checkConditionArray:self.columnVictoryMoves forArray:oArray];
    BOOL isPlayer1Condition2Met = [self checkConditionArray:self.rowVictoryMoves forArray:xArray];
    BOOL isPlayer2Condition2Met = [self checkConditionArray:self.rowVictoryMoves forArray:oArray];
    BOOL isPlayer1Condition3Met = [self checkConditionArray:self.diagonalVictoryMoves forArray:xArray];
    BOOL isPlayer2Condition3Met = [self checkConditionArray:self.diagonalVictoryMoves forArray:oArray];
    
    
    if (isPlayer1Condition1Met || isPlayer1Condition2Met || isPlayer1Condition3Met) {
        winner = @"X";
    } else if (isPlayer2Condition1Met || isPlayer2Condition2Met || isPlayer2Condition3Met) {
        winner = @"O";
    } else if ([xArray count] + [oArray count] == 9) {
        winner = @"None";
    }
    

    return winner;
    
    
}

/*!
 * This methods provides an UIAlertView message to the winner. If the game is
 * a draw, the alert view shows the corresponding draw message
 * 
 * \param winner The string that determines who is the winner eg. X, O, None
 *
 */
- (void) showVictoryAlertView:(NSString *)winner {
    NSString *message = nil;
    NSString *title = nil;
    if ([winner isEqualToString:@"None"]) {
        title = @"No winner";
        message = [NSString stringWithFormat:@"%@", @"The game is a draw"];
    } else {
        title = @"Congratulations";
        message = [NSString stringWithFormat:@"%@ %@", winner, @"player has won..."];
    }
    UIAlertView * winnerAlertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Play Again" otherButtonTitles: nil];
    [winnerAlertView show];
}


- (IBAction)firstCellTouched:(id)sender {
    
    if ([self.firstCell image] == nil) {
        NSNumber * cell = [NSNumber numberWithInt:0];
        if ([self.state isEqualToString:@"X"]) {
            [self.xMovesArray addObject:cell];
        } else {
            [self.oMovesArray addObject:cell];
        }
        [self.firstCell setImage:self.image];
        NSString *winner = [self winner:self.xMovesArray :self.oMovesArray];
        if (winner != nil) {
            [self startNewGame:winner];
        } else {
            [self changeState];
        }
    }
}
- (IBAction)secondCellTouched:(id)sender {
    if ([self.secondCell image] == nil) {
        NSNumber * cell = [NSNumber numberWithInt:1];
        if ([self.state isEqualToString:@"X"]) {
            [self.xMovesArray addObject:cell];
        } else {
            [self.oMovesArray addObject:cell];
        }
        [self.secondCell setImage:self.image];
        NSString *winner = [self winner:self.xMovesArray :self.oMovesArray];
        if (winner != nil) {
            [self startNewGame:winner];
        } else {
            [self changeState];
        }
    }
}

- (IBAction)thirdCellTouched:(id)sender {
    if ([self.thirdCell image] == nil) {
        NSNumber * cell = [NSNumber numberWithInt:2];
        if ([self.state isEqualToString:@"X"]) {
            [self.xMovesArray addObject:cell];
        } else {
            [self.oMovesArray addObject:cell];
        }
        
        [self.thirdCell setImage:self.image];
        NSString *winner = [self winner:self.xMovesArray :self.oMovesArray];
        if (winner != nil) {
            [self startNewGame:winner];
        } else {
            [self changeState];
        }
    }
}
- (IBAction)fourthCellTouched:(id)sender {
    if ([self.fourthCell image] == nil) {
        NSNumber * cell = [NSNumber numberWithInt:3];
        if ([self.state isEqualToString:@"X"]) {
            [self.xMovesArray addObject:cell];
        } else {
            [self.oMovesArray addObject:cell];
        }
        [self.fourthCell setImage:self.image];
        NSString *winner = [self winner:self.xMovesArray :self.oMovesArray];
        if (winner != nil) {
            [self startNewGame:winner];
        } else {
            [self changeState];
        }
    }
}

- (IBAction)fifthCellTouched:(id)sender{
    if ([self.fifthCell image] == nil) {
        NSNumber * cell = [NSNumber numberWithInt:4];
        if ([self.state isEqualToString:@"X"]) {
            [self.xMovesArray addObject:cell];
        } else {
            [self.oMovesArray addObject:cell];
        }
        [self.fifthCell setImage:self.image];
        NSString *winner = [self winner:self.xMovesArray :self.oMovesArray];
        if (winner != nil) {
            [self startNewGame:winner];
        } else {
            [self changeState];
        }
    }
}

- (IBAction)sixthCellTouched:(id)sender {
    if ([self.sixthCell image] == nil) {
        NSNumber * cell = [NSNumber numberWithInt:5];
        if ([self.state isEqualToString:@"X"]) {
            [self.xMovesArray addObject:cell];
        } else {
            [self.oMovesArray addObject:cell];
        }
        [self.sixthCell setImage:self.image];
        NSString *winner = [self winner:self.xMovesArray :self.oMovesArray];
        if (winner != nil) {
            [self startNewGame:winner];
        } else {
            [self changeState];
        }
    }
}

- (IBAction)seventhCellTouched:(id)sender {
    
    if ([self.seventhCell image] == nil) {
        NSNumber * cell = [NSNumber numberWithInt:6];
        [self.seventhCell setImage:self.image];
        if ([self.state isEqualToString:@"X"]) {
            [self.xMovesArray addObject:cell];
        } else {
            [self.oMovesArray addObject:cell];
        }
        NSString *winner = [self winner:self.xMovesArray :self.oMovesArray];
        if (winner != nil) {
            [self startNewGame:winner];
        } else {
            [self changeState];
        }
    }
}

- (IBAction)eightCellTouched:(id)sender {
    if ([self.eightCell image] == nil) {
        NSNumber * cell = [NSNumber numberWithInt:7];
        if ([self.state isEqualToString:@"X"]) {
            [self.xMovesArray addObject:cell];
        } else {
            [self.oMovesArray addObject:cell];
        }
        [self.eightCell setImage:self.image];
        NSString *winner = [self winner:self.xMovesArray :self.oMovesArray];
        if (winner != nil) {
            [self startNewGame:winner];
        } else {
            [self changeState];
        }
    }
}

- (IBAction)ninthCellTouched:(id)sender {
    if ([self.ninthCell image] == nil) {
        NSNumber * cell = [NSNumber numberWithInt:8];
        if ([self.state isEqualToString:@"X"]) {
            [self.xMovesArray addObject:cell];
        } else {
            [self.oMovesArray addObject:cell];
        }
        [self.ninthCell setImage:self.image];
        NSString *winner = [self winner:self.xMovesArray :self.oMovesArray];
        if (winner != nil) {
            [self startNewGame:winner];
        } else {
            [self changeState];
        }
    }
}





@end
