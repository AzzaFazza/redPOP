//
//  ViewController.m
//  redPOP
//
//  Created by azza on 06/02/2014.
//  Copyright (c) 2014 dot.ly. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>
#import <QuartzCore/QuartzCore.h>
#import <SpriteKit/SpriteKit.h>

@interface ViewController (){
    bool stillValid;
    NSString* scoreString;
}

@end

@implementation ViewController
@synthesize button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15, buttons, myCounterLabel, startButton, touch, swipe;

bool notFinished = YES;
int seconds,minutes, hours;
int secondsLeft;
UIAlertView*alert;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setFontFamily:@"MixStitch" forView:self.view andSubViews:YES];
    
	// Do any additional setup after loading the view, typically from a nib.
    stillValid = true;
    secondsLeft = 30;
    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"food.png"]];
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
}
-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubViews
{
    if ([view isKindOfClass:[UILabel class]])
    {
        UILabel *lbl = (UILabel *)view;
        [lbl setFont:[UIFont fontWithName:fontFamily size:[[lbl font] pointSize]]];
    }
    
    if (isSubViews)
    {
        for (UIView *sview in view.subviews)
        {
            [self setFontFamily:fontFamily forView:sview andSubViews:YES];
        }
    }
}

//hide status bar
- (BOOL)prefersStatusBarHidden {
    return YES;
}

//Timer
- (void)updateCounter:(NSTimer *)theTimer {
    if(!secondsLeft == 0 && theTimer > 0){
        startButton.hidden = YES;
        secondsLeft -- ;
        [self alternateColors];
        seconds = (secondsLeft %3600) % 60;
    }
        if(!timer < 9){
                    myCounterLabel.text = [NSString stringWithFormat:@"%2d", seconds];
            }
                else{
                    secondsLeft = 0;
                    
            }
    if(secondsLeft  <= 0){
        scoreString = [NSString stringWithFormat:@"You Got A Score of:%5d", score];
        alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:scoreString delegate:nil cancelButtonTitle:@"Restart" otherButtonTitles:nil , nil];
        [alert show];
    }
}


-(void)countdownTimer{
    
    secondsLeft = seconds = 5;
    
        if([timer isValid]){
            stillValid = false;
        }
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

-(void)callColors{
    {
        [self performSelector: @selector(alternateColors) withObject:nil afterDelay: 0.03];
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(alternateColors) userInfo:nil repeats:notFinished];
        
    }
    return;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
}
-(void)alternateColors{
    //This for loop will set up the buttons and will also set the background of the image
    buttons = [NSMutableArray array];
    for(int i = 1; i <= 15; ++i) {
        [buttons addObject:[self valueForKey:[NSString stringWithFormat:@"button%d", i]]];
    }
    
    // Calculate new values and assume the result means color button red or blue
    [UIView animateWithDuration:0.5 animations:^{
        for (int x = 0;  x < 15; x++) {
            int r = arc4random() % 15;
            [buttons[r]setTitleColor:[UIColor colorWithRed:255.0 green:000.0 blue:000 alpha:1.0] forState: UIControlStateNormal];
            UIImage *buttonImage = [UIImage imageNamed:@"blue.png"];
            [buttons[r] setImage:buttonImage forState:UIControlStateNormal];
        }
        
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.8 delay:5.0 options:nil animations:^{
                for (int x = 0;  x < 15; x++) {
                    int r = arc4random() % 15;
                    [buttons[r] setTitleColor:[UIColor colorWithRed:000.0 green:000.0 blue:255.0 alpha:1.0] forState: UIControlStateNormal];
                    UIImage *buttonImage = [UIImage imageNamed:@"red.png"];
                    [buttons[r] setImage:buttonImage forState:UIControlStateNormal];
                }
            } completion:nil];};
    }];
}

-(IBAction)pressedButton:(id)sender{
    score = 0;
    [self countdownTimer];
    //[self callColors];
    
}

-(IBAction)goodTouch:(id)sender{
    score++;
    myScore.text = [NSString stringWithFormat:@"%5d", score];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
