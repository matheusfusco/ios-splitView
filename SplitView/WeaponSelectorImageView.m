//
//  WeaponSelectorImageView.m
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 05/09/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import "WeaponSelectorImageView.h"

@implementation WeaponSelectorImageView

#pragma mark - Overridden setters
-(void)setWeapon:(Weapon *)weapon
{
    if (_weapon != weapon) {
        _weapon = weapon;
        
        self.image = [_weapon weaponImage];
    }
}

#pragma mark - Superclass overrides
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(UIView *)inputView
{
    if (_weaponInputController == nil) {
        _weaponInputController = [[WeaponInputViewController alloc] initWithNibName:nil bundle:nil];
        _weaponInputController.delegate = self;
    }
    
    return _weaponInputController.view;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (![self isFirstResponder]) {
        [self becomeFirstResponder];
    }
}

#pragma mark - WeaponInputDelegate methods
-(void)closeTapped
{
    [self resignFirstResponder];
}

-(void)selectedWeaponType:(WeaponType)weaponType
{
    [self setWeapon:[Weapon newWeaponOfType:weaponType]];
    
    [self resignFirstResponder];
    
    if (_delegate != nil) {
        [_delegate selectedWeapon:_weapon];
    }
}

@end
