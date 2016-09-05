//
//  Monster.h
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 30/08/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Weapon.h"

@interface Monster : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * descr;
@property (nonatomic, strong) NSString * iconName;
@property (nonatomic, strong) Weapon * weapon;

+(Monster *)newMonsterWithName:(NSString *)name description:(NSString *)description iconName:(NSString *)iconName weapon:(Weapon *)weapon;

@end
