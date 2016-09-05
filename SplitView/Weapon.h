//
//  Weapon.h
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 01/09/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    Blowgun = 0,
    NinjaStar,
    Fire,
    Sword,
    Smoke,
} WeaponType;

@interface Weapon : NSObject

@property (nonatomic, assign) WeaponType weaponType;

+(Weapon *)newWeaponOfType:(WeaponType)weaponType;

-(UIImage *)weaponImage;

@end
