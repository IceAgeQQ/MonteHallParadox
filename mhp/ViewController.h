//
//  ViewController.h
//  mhp
//
//  Created by Xu, Chao on 8/30/12.
//  Copyright (c) 2012 Xu, Chao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController{
    SystemSoundID WinSoundID;
    SystemSoundID LoserSoundID;
}

@property (retain, nonatomic) IBOutlet UIImageView *door1;
@property (retain, nonatomic) IBOutlet UIImageView *door2;
@property (retain, nonatomic) IBOutlet UIImageView *door3;
@property (retain, nonatomic) IBOutlet UIImageView *door4;
@property (retain, nonatomic) IBOutlet UIImageView *door5;
@property (retain, nonatomic) IBOutlet UIImageView *door6;

@property (retain, nonatomic) IBOutlet UISegmentedControl *doorSelector;
@property (retain, nonatomic) IBOutlet UILabel *selectLBL;
@property (retain, nonatomic) IBOutlet UIButton *revealBTN;
@property (retain, nonatomic) IBOutlet UISegmentedControl *keepSelector;

@property (retain, nonatomic) IBOutlet UIImageView *arrow1;
@property (retain, nonatomic) IBOutlet UIImageView *arrow2;
@property (retain, nonatomic) IBOutlet UIImageView *arrow3;

@property (retain, nonatomic) IBOutlet UILabel *keepTotal;
@property (retain, nonatomic) IBOutlet UILabel *keepWin;
@property (retain, nonatomic) IBOutlet UILabel *keepLoss;

@property (retain, nonatomic) IBOutlet UILabel *switchTotal;
@property (retain, nonatomic) IBOutlet UILabel *switchWin;
@property (retain, nonatomic) IBOutlet UILabel *switchLoss;

@property (retain, nonatomic) IBOutlet UIButton *showBTN;
@property (retain, nonatomic) IBOutlet UIButton *resetBTN;

- (IBAction)doorSelected:(id)sender;
- (void)showArrow;
- (IBAction)revealDoor:(id)sender;
- (IBAction)keepSwitch:(id)sender;
- (IBAction)showResult:(id)sender;
- (void)resetDoors;
- (IBAction)resetGame:(id)sender;

- (void)revealDoor1;
- (void)revealDoor2;
- (void)revealDoor3;





@end
