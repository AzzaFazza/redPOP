//
//  ViewController.h
//  redPOP
//
//  Created by azza on 06/02/2014.
//  Copyright (c) 2014 dot.ly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSTimer *timer;
    IBOutlet UILabel *myCounterLabel;
    int score;
    IBOutlet UILabel *myScore;
}

//Buttons
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIButton *button5;
@property (strong, nonatomic) IBOutlet UIButton *button6;
@property (strong, nonatomic) IBOutlet UIButton *button7;
@property (strong, nonatomic) IBOutlet UIButton *button8;
@property (strong, nonatomic) IBOutlet UIButton *button9;
@property (strong, nonatomic) IBOutlet UIButton *button10;
@property (strong, nonatomic) IBOutlet UIButton *button11;
@property (strong, nonatomic) IBOutlet UIButton *button12;
@property (strong, nonatomic) IBOutlet UIButton *button13;
@property (strong, nonatomic) IBOutlet UIButton *button14;
@property (strong, nonatomic) IBOutlet UIButton *button15;
@property (strong, nonatomic) IBOutlet UIButton *startButton;

//Timer
@property (strong, nonatomic) IBOutlet UILabel *myCounterLabel;
-(void)updateCounter:(NSTimer *)theTimer;
-(void)countdownTimer;

-(IBAction)pressedButton:(id)sender;

//Swipe Gesture
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipe;

//Touch Gesture
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *touch;


-(IBAction)goodTouch:(id)sender;
-(IBAction)badTouch:(id)sender;


@property(nonatomic,assign) double duration;
@property(nonatomic,retain) NSMutableArray *buttons;

- (void)animateWithWords:(NSArray *)words forDuration:(double)time;
@end
