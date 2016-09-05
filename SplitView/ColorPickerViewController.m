//
//  ColorPickerViewController.m
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 31/08/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import "ColorPickerViewController.h"

@interface ColorPickerViewController ()

@end

@implementation ColorPickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        _colorNames = [NSMutableArray array];
        
        [_colorNames addObject:@"Red"];
        [_colorNames addObject:@"Green"];
        [_colorNames addObject:@"Blue"];
        
        self.clearsSelectionOnViewWillAppear = NO;
        
        //Calculate height of the view
        NSInteger rowsCount = [_colorNames count];
        NSInteger singleRowHeight = [self.tableView.delegate tableView:self.tableView
                                               heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        NSInteger totalRowsHeight = rowsCount * singleRowHeight;
        
        //Calculate width of the view
        CGFloat largestLabelWidth = 0;
        for (NSString *colorName in _colorNames) {
            //Checks size of text using the default font for UITableViewCell's textLabel.
            NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14]};
            CGSize labelSize = [colorName sizeWithAttributes:attributes];
            if (labelSize.width > largestLabelWidth) {
                largestLabelWidth = labelSize.width;
            }
        }
        
        //Add padding to the width
        CGFloat popoverWidth = largestLabelWidth + 100;
        
        //Set the property to tell the popover container how big this view will be.
        self.preferredContentSize = CGSizeMake(popoverWidth, totalRowsHeight);
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
    return _colorNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_colorNames objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *selectedColorName = [_colorNames objectAtIndex:indexPath.row];
    UIColor *color = [UIColor blackColor];
    
    if ([selectedColorName isEqualToString:@"Red"])
    {
        color = [UIColor redColor];
    }
    else if ([selectedColorName isEqualToString:@"Green"])
    {
        color = [UIColor greenColor];
    }
    else if ([selectedColorName isEqualToString:@"Blue"])
    {
        color = [UIColor blueColor];
    }
    
    if (_delegate) {
        [_delegate selectedColor:color];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

#pragma mark - Memory Management
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
