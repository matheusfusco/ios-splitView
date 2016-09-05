//
//  Monster.m
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 30/08/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import "Monster.h"

@implementation Monster

+(Monster *)newMonsterWithName:(NSString *)name description:(NSString *)description iconName:(NSString *)iconName weapon:(Weapon *)weapon
{
    
    Monster *monster = [[Monster alloc] init];
    monster.name = name;
    monster.descr = description;
    monster.iconName = iconName;
    monster.weapon = weapon;
    
    return monster;
}

@end
