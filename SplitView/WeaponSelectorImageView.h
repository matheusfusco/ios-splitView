//
//  WeaponSelectorImageView.h
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 05/09/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeaponInputViewController.h" //Has Input delegate as well.
@class Weapon;

@protocol WeaponSelectorDelegate <NSObject>
-(void)selectedWeapon:(Weapon *)weapon;
@end

@interface WeaponSelectorImageView : UIImageView <WeaponInputDelegate>

@property (nonatomic, strong) Weapon * weapon;
@property (nonatomic, strong) WeaponInputViewController * weaponInputController;
@property (nonatomic, strong) IBOutlet id <WeaponSelectorDelegate> delegate;

@end
