//
//  WeaponInputViewController.h
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 05/09/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weapon.h"

@protocol WeaponInputDelegate <NSObject>
@required
-(void)selectedWeaponType:(WeaponType)weaponType;
-(void)closeTapped;
@end

@interface WeaponInputViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *blowgunButton;
@property (nonatomic, weak) IBOutlet UIButton *fireButton;
@property (nonatomic, weak) IBOutlet UIButton *ninjaStarButton;
@property (nonatomic, weak) IBOutlet UIButton *smokeButton;
@property (nonatomic, weak) IBOutlet UIButton *swordButton;
@property (nonatomic, weak) id <WeaponInputDelegate> delegate;

-(IBAction)weaponButtonTapped:(UIButton *)sender;
-(IBAction)closeTapped;
@end
