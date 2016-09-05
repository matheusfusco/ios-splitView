//
//  LeftViewController.m
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 30/08/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import "LeftViewController.h"
#import "Monster.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Monsters";
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        _monsters = [NSMutableArray array];
        
        
        //Create monster objects then add them to the array.
        [_monsters addObject:[Monster newMonsterWithName:@"Cat-Bot"
                                             description:@"MEE-OW"
                                                iconName:@"meetcatbot.png"
                                                  weapon:[Weapon newWeaponOfType:Sword]]];
        
        [_monsters addObject:[Monster newMonsterWithName:@"Dog-Bot"
                                             description:@"BOW-WOW"
                                                iconName:@"meetdogbot.png"
                                                  weapon:[Weapon newWeaponOfType:Blowgun]]];
        
        [_monsters addObject:[Monster newMonsterWithName:@"Explode-Bot"
                                             description:@"Tick, tick, BOOM!"
                                                iconName:@"meetexplodebot.png"
                                                  weapon:[Weapon newWeaponOfType:Smoke]]];
        
        [_monsters addObject:[Monster newMonsterWithName:@"Fire-Bot"
                                             description:@"Will Make You Steamed"
                                                iconName:@"meetfirebot.png"
                                                  weapon:[Weapon newWeaponOfType:NinjaStar]]];
        
        [_monsters addObject:[Monster newMonsterWithName:@"Ice-Bot"
                                             description:@"Has A Chilling Effect"
                                                iconName:@"meeticebot.png"
                                                  weapon:[Weapon newWeaponOfType:Fire]]];
        
        [_monsters addObject:[Monster newMonsterWithName:@"Mini-Tomato-Bot"
                                             description:@"Extremely Handsome"
                                                iconName:@"meetminitomatobot.png"
                                                  weapon:[Weapon newWeaponOfType:NinjaStar]]];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_monsters count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Monster *monster = _monsters[indexPath.row];
    cell.textLabel.text = monster.name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Monster *selectedMonster = [_monsters objectAtIndex:indexPath.row];
    if (_delegate) {
        [_delegate selectedMonster:selectedMonster];
    }
}

#pragma mark - Memory Management
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
