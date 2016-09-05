//
//  RightViewController.h
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 30/08/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Monster.h"
#import "LeftViewController.h"
#import "ColorPickerViewController.h"
#import "WeaponSelectorImageView.h"

@interface RightViewController : UIViewController <MonsterSelectionDelegate, ColorPickerDelegate, WeaponSelectorDelegate, UISplitViewControllerDelegate, UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong) Monster * monster;
@property (nonatomic, weak) IBOutlet UILabel * nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * descriptionLabel;
@property (nonatomic, weak) IBOutlet UIImageView * iconImageView;
@property (nonatomic, weak) IBOutlet WeaponSelectorImageView * weaponImageView;
@property (nonatomic, strong) ColorPickerViewController * colorPicker;
-(IBAction)chooseColorButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem * rightButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem * leftButtonItem;
@property (weak, nonatomic) IBOutlet UINavigationBar * navBar;

@end
