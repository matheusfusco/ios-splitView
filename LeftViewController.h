//
//  LeftViewController.h
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 30/08/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Monster.h"
#import "Weapon.h"

@protocol MonsterSelectionDelegate <NSObject>
@required
-(void)selectedMonster:(Monster *)newMonster;
@end

@interface LeftViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *monsters;
@property (nonatomic, assign) id <MonsterSelectionDelegate> delegate;
@end

