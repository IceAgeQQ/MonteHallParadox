//
//  ViewController.m
//  mhp
//
//  Created by Xu, Chao on 8/30/12.
//  Copyright (c) 2012 Xu, Chao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize door1;
@synthesize door2;
@synthesize door3;
@synthesize door4;
@synthesize door5;
@synthesize door6;
@synthesize doorSelector;
@synthesize selectLBL;
@synthesize revealBTN;
@synthesize keepSelector;
@synthesize arrow1;
@synthesize arrow2;
@synthesize arrow3;
@synthesize keepTotal;
@synthesize keepWin;
@synthesize keepLoss;
@synthesize switchTotal;
@synthesize switchWin;
@synthesize switchLoss;
@synthesize showBTN;
@synthesize resetBTN;

UIImageView *imageView1;
UIImageView *imageView2;
UIImageView *imageView3;
UIImageView *imageView4;

int playerChoice;
int doorWinner;
int doorRevealed;
int SwitchTotalCounter;
int SwitchWinCounter;
int SwitchLossCounter;
int KeepTotalCounter;
int KeepWinCounter;
int KeepLossCounter;

bool isWinner;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ;
    NSString *WinnerPath = [[NSBundle mainBundle] pathForResource:@"WINNER" ofType:@"WAV"];
    NSString *LoserPath = [[NSBundle mainBundle] pathForResource:@"LoserHorns" ofType:@"wav"];
    
//    NSLog(@"%@",WinnerPath);
//    NSLog(@"%@",LoserPath);
    
    AudioServicesCreateSystemSoundID((CFURLRef) [NSURL fileURLWithPath :WinnerPath ],&WinSoundID);
    
    AudioServicesCreateSystemSoundID((CFURLRef) [NSURL fileURLWithPath :LoserPath ],&LoserSoundID);
    
    doorWinner = ((arc4random() % 3) + 1);
     SwitchTotalCounter =0;
     SwitchWinCounter = 0;
     SwitchLossCounter = 0;
     KeepTotalCounter = 0;
     KeepWinCounter = 0;
     KeepLossCounter = 0;
}

- (void)viewDidUnload
{
    [self setDoor1:nil];
    [self setDoor2:nil];
    [self setDoor3:nil];
    [self setDoorSelector:nil];
    [self setSelectLBL:nil];
    [self setRevealBTN:nil];
    [self setKeepSelector:nil];
    [self setArrow1:nil];
    [self setArrow2:nil];
    [self setArrow3:nil];
    [self setKeepTotal:nil];
    [self setKeepWin:nil];
    [self setKeepLoss:nil];
    [self setSwitchTotal:nil];
    [self setSwitchWin:nil];
    [self setSwitchLoss:nil];
    [self setShowBTN:nil];
    [self setResetBTN:nil];
    [self setDoor1:nil];
    [self setDoor4:nil];
    [self setDoor5:nil];
    [self setDoor6:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dealloc {
    [door1 release];
    [door2 release];
    [door3 release];
    [doorSelector release];
    [selectLBL release];
    [revealBTN release];
    [keepSelector release];
    [arrow1 release];
    [arrow2 release];
    [arrow3 release];
    [keepTotal release];
    [keepWin release];
    [keepLoss release];
    [keepTotal release];
    [keepWin release];
    [keepLoss release];
    [switchTotal release];
    [switchWin release];
    [switchLoss release];
    [showBTN release];
    [resetBTN release];
    [door4 release];
    [door5 release];
    [door6 release];
    [super dealloc];
}
- (IBAction)doorSelected:(id)sender {
    selectLBL.hidden = TRUE;
    revealBTN.hidden = FALSE;
    doorSelector.hidden = TRUE;
    
    if(doorSelector.selectedSegmentIndex == 0){
        playerChoice = 1;
    }
    
    if(doorSelector.selectedSegmentIndex == 1){
        playerChoice = 2;
    }
    
    if(doorSelector.selectedSegmentIndex == 2){
        playerChoice = 3;
    }
    [self showArrow];
    
}

- (void)showArrow {
    if (playerChoice == 1){
        arrow1.hidden = FALSE;
        arrow2.hidden = TRUE;
        arrow3.hidden = TRUE;
    }

    if (playerChoice == 2){
        arrow1.hidden = TRUE;
        arrow2.hidden = FALSE;
        arrow3.hidden = TRUE;
    }

    if (playerChoice == 3){
        arrow1.hidden = TRUE;
        arrow2.hidden = TRUE;
        arrow3.hidden = FALSE;
    }
}

- (IBAction)revealDoor:(id)sender {
    
    bool selectionRepeat = TRUE ;
    
    while (selectionRepeat) {
        doorRevealed = ((arc4random()%3)+1);
        if (doorRevealed != doorWinner && doorRevealed != playerChoice) {
            selectionRepeat = FALSE;
        }
    }
    
    
if(doorRevealed == 1)[self revealDoor1];
if(doorRevealed == 2)[self revealDoor2];
if(doorRevealed == 3)[self revealDoor3];
    revealBTN.hidden =TRUE;
    keepSelector.hidden =FALSE;
}

- (IBAction)keepSwitch:(id)sender {
    
    if (keepSelector.selectedSegmentIndex == 0) {
        if (doorRevealed == 1) {
            if (playerChoice ==2){
                playerChoice = 3;
            }else{
                playerChoice = 2;
            }

        }
        if (doorRevealed == 2) {
            if(playerChoice == 1){
                playerChoice =3;
            }else{
                playerChoice =1;
            }
        }
        if (doorRevealed == 3) {
            if(playerChoice == 1){
                playerChoice =2;
            }else{
                playerChoice =1;
            }
        }
        [self showArrow];
        SwitchTotalCounter ++;
        if (playerChoice == doorWinner) {
            SwitchWinCounter ++;
            isWinner = TRUE;
        }else{
            SwitchLossCounter ++;
            isWinner = FALSE;
        }
        
    }    else{
        KeepTotalCounter ++;
        if (playerChoice == doorWinner) {
            KeepWinCounter ++;
            isWinner = TRUE;
        }else{
            KeepLossCounter ++;
            isWinner = FALSE;
        }
        
    }
    
    keepSelector.hidden = TRUE;
    showBTN.hidden = FALSE;
}

- (IBAction)showResult:(id)sender {
    
    
    
    [self revealDoor1];
    [self revealDoor2];
    [self revealDoor3];
    
    showBTN.hidden = TRUE;
    resetBTN.hidden = FALSE;
    
    keepTotal.text =[[NSString alloc] initWithFormat:@"%d",KeepTotalCounter];
    switchTotal.text =[[NSString alloc] initWithFormat:@"%d",SwitchTotalCounter];
    keepWin.text =[[NSString alloc] initWithFormat:@"%d",KeepWinCounter];
    switchWin.text =[[NSString alloc] initWithFormat:@"%d",SwitchWinCounter];
    keepLoss.text =[[NSString alloc] initWithFormat:@"%d",KeepLossCounter];
    switchLoss.text =[[NSString alloc] initWithFormat:@"%d",SwitchLossCounter];

    if (isWinner) {
        AudioServicesPlayAlertSound(WinSoundID);
    }else{
        AudioServicesPlayAlertSound(LoserSoundID);
    }


}

- (void)resetDoors{
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"door"]];
    
    [imageView1 setFrame:CGRectMake(0, 0, 82, 128)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door1 cache:YES];
    [imageView2 removeFromSuperview];
    [door1 addSubview:imageView1];
    [UIView commitAnimations];
    
    
    imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myDoor"]];
    [imageView4 setFrame:CGRectMake(0, 0, 287, 308)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door4 cache:YES];
     [imageView3 removeFromSuperview];
    [door4 addSubview:imageView4];
    [UIView commitAnimations];
    
    
    
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"door"]];
    
    [imageView1 setFrame:CGRectMake(0, 0, 82, 128)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door2 cache:YES];
    [imageView2 removeFromSuperview];
    [door2 addSubview:imageView1];
    [UIView commitAnimations];
    
    
    imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myDoor"]];
    [imageView4 setFrame:CGRectMake(0, 0, 287, 308)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door5 cache:YES];
    [imageView3 removeFromSuperview];
    [door5 addSubview:imageView4];
    [UIView commitAnimations];
    
    
    
    imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"door"]];
    
    [imageView1 setFrame:CGRectMake(0, 0, 82, 128)];
   
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door3 cache:YES];
    [imageView2 removeFromSuperview];
    [door3 addSubview:imageView1];
    [UIView commitAnimations];
    
    
    imageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myDoor"]];
     [imageView4 setFrame:CGRectMake(0, 0, 287, 308)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door6 cache:YES];
    [imageView3 removeFromSuperview];
     [door6 addSubview:imageView4];
    [UIView commitAnimations];

}

- (IBAction)resetGame:(id)sender {
    doorWinner = ((arc4random() % 3) + 1);
    resetBTN.hidden = TRUE;
    [self resetDoors];
    
    arrow1.hidden = TRUE;
    arrow2.hidden = TRUE;
    arrow3.hidden = TRUE;
    
    doorSelector.hidden = FALSE;
    
    [doorSelector setSelectedSegmentIndex:UISegmentedControlNoSegment];
    [keepSelector setSelectedSegmentIndex:UISegmentedControlNoSegment];
}
    
- (void)revealDoor1{
    
    if (doorWinner == 1) {
        imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"winner"]];
        
        imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gift"]];
    }
    else{
    imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"looser"]];
        
    imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redCross"]];
    }
    
    [imageView2 setFrame:CGRectMake(0, 45, 82, 72)];
    [door1 addSubview:imageView2];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door1 cache:YES];
    [UIView commitAnimations];
    
    [imageView3 setFrame:CGRectMake(30, 100, 235, 200)];
    [door4 addSubview:imageView3];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door4 cache:YES];
    [UIView commitAnimations];
}

- (void)revealDoor2{
    if (doorWinner == 2) {
        imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"winner"]];
        imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gift"]];
    }
    else{
        imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"looser"]];
        imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redCross"]];
    }
    [imageView2 setFrame:CGRectMake(0, 45, 82, 72)];
    [door2 addSubview:imageView2];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door2 cache:YES];
    [UIView commitAnimations];
    
     [imageView3 setFrame:CGRectMake(30, 100, 235, 200)];
    [door5 addSubview:imageView3];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door5 cache:YES];
    [UIView commitAnimations];
}


- (void)revealDoor3{
    if (doorWinner == 3) {
        imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"winner"]];
        imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gift"]];
    }
    else{
        imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"looser"]];
        imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redCross"]];
    }
    [imageView2 setFrame:CGRectMake(0, 45, 82, 72)];
    [door3 addSubview:imageView2];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door3 cache:YES];
    [UIView commitAnimations];
    
    
    [imageView3 setFrame:CGRectMake(30, 100, 235, 200)];
    [door6 addSubview:imageView3];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.50];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(transitionDidStop:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:door6 cache:YES];
    [UIView commitAnimations];
}




@end
