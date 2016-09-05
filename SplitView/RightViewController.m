//
//  RightViewController.m
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 30/08/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import "RightViewController.h"
#import "Monster.h"
#import "Weapon.h"

@implementation RightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self refreshUI];
    [_leftButtonItem setAction:self.splitViewController.displayModeButtonItem.action];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)setMonster:(Monster *)monster
{
    if (_monster != monster) {
        _monster = monster;
        
        [self refreshUI];
    }
}

-(void)refreshUI
{
    _nameLabel.text = _monster.name;
    _iconImageView.image = [UIImage imageNamed:_monster.iconName];
    _descriptionLabel.text = _monster.descr;
    _weaponImageView.weapon = _monster.weapon;
}

#pragma mark - LeftVC Delegate Method
-(void)selectedMonster:(Monster *)newMonster
{
    [self setMonster:newMonster];
    //[self.splitViewController setPreferredDisplayMode:1];
    [UIView animateWithDuration:0.2 animations:^{
        self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    } completion:nil];
}

#pragma mark - UISplitViewController Delegate Methods
-(void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode
{
    switch ((long)displayMode) {
        case 1:
        {
            //NSLog(@"hide left menu");
            break;
        }
        
        case 3:
        {
            //NSLog(@"show left menu");
            break;
        }
            
        default:
        {
            break;
        }
    }
}

#pragma mark - IBActions
-(IBAction)chooseColorButtonTapped:(id)sender
{
    if (_colorPicker == nil) {
        _colorPicker = [[ColorPickerViewController alloc] initWithStyle:UITableViewStylePlain];
        _colorPicker.delegate = self;
    }
    _colorPicker.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:_colorPicker animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [_colorPicker popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.rightButtonItem;
    popController.delegate = self;
    popController.sourceRect = CGRectMake(0, 0, 100, 100);
}

#pragma mark - ColorPicker Delegate Methods
-(void)selectedColor:(UIColor *)newColor
{
    _nameLabel.textColor = newColor;
    [self dismissViewControllerAnimated:_colorPicker completion:nil];
}

#pragma mark - WeaponSelectorDelegate method
-(void)selectedWeapon:(Weapon *)weapon
{
    if (_monster.weapon != weapon) {
        _monster.weapon = weapon;
    }
}

#pragma mark - Memory Management
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
