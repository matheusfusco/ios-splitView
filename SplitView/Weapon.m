//
//  Weapon.m
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 01/09/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import "Weapon.h"

@implementation Weapon

+(Weapon *)newWeaponOfType:(WeaponType)weaponType
{
    Weapon *weapon = [[Weapon alloc] init];
    weapon.weaponType = weaponType;
    
    return weapon;
}

-(UIImage *)weaponImage
{
    NSLog(@"weaponType: %ld", (long)self.weaponType);
    switch (self.weaponType) {
        case Blowgun:
        {
            return [UIImage imageNamed:@"blowgun.png"];
            break;
        }
        case Fire:
        {
            return [UIImage imageNamed:@"fire.png"];
            break;
        }
        case NinjaStar:
        {
            return [UIImage imageNamed:@"ninjastar.png"];
            break;
        }
        case Smoke:
        {
            return [UIImage imageNamed:@"smoke.png"];
            break;
        }
        case Sword:
        {
            return [UIImage imageNamed:@"sword.png"];
            break;
        }
        default:
        {
            //Anything not named in the enum.
            return [UIImage imageNamed:@"sword.png"];
            break;
        }
    }
}

@end
