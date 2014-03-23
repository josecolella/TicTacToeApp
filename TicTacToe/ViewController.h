//
//  ViewController.h
//  TicTacToe
//
//  Created by Jose Colella on 21/03/2014.
//  Copyright (c) 2014 Jose Colella. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
@property (strong, nonatomic) NSString * state;
@property (strong, nonatomic) UIImage * image;
@property (strong, nonatomic) NSArray * rowVictoryMoves;
@property (strong, nonatomic) NSArray * columnVictoryMoves;
@property (strong, nonatomic) NSArray * diagonalVictoryMoves;

@property (strong, nonatomic) NSMutableArray * xMovesArray;
@property (strong, nonatomic) NSMutableArray * oMovesArray;

@property (strong, nonatomic) IBOutlet UIImageView *firstCell;
@property (strong, nonatomic) IBOutlet UIImageView *secondCell;
@property (strong, nonatomic) IBOutlet UIImageView *thirdCell;
@property (strong, nonatomic) IBOutlet UIImageView *fourthCell;
@property (strong, nonatomic) IBOutlet UIImageView *fifthCell;
@property (strong, nonatomic) IBOutlet UIImageView *sixthCell;
@property (strong, nonatomic) IBOutlet UIImageView *seventhCell;
@property (strong, nonatomic) IBOutlet UIImageView *eightCell;
@property (strong, nonatomic) IBOutlet UIImageView *ninthCell;


- (void) changeState;
- (void) startNewGame:(NSString *)winner;
- (BOOL) checkConditionArray:(NSArray *)conditionArray forArray:(NSArray *)playerArray;
- (NSString *) winner:(NSArray *)xArray :(NSArray *)oArray;
- (void) showVictoryAlertView:(NSString *)winner;


- (IBAction)firstCellTouched:(id)sender;
- (IBAction)secondCellTouched:(id)sender;
- (IBAction)thirdCellTouched:(id)sender;
- (IBAction)fourthCellTouched:(id)sender;
- (IBAction)fifthCellTouched:(id)sender;
- (IBAction)sixthCellTouched:(id)sender;
- (IBAction)seventhCellTouched:(id)sender;
- (IBAction)eightCellTouched:(id)sender;
- (IBAction)ninthCellTouched:(id)sender;



@end
