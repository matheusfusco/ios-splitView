//
//  ColorPickerViewController.h
//  SplitView
//
//  Created by Matheus Pacheco Fusco on 31/08/16.
//  Copyright © 2016 MatheusFusco. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorPickerDelegate <NSObject>
@required
-(void)selectedColor:(UIColor *)newColor;
@end

@interface ColorPickerViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray * colorNames;
@property (nonatomic, assign) id <ColorPickerDelegate> delegate;
@end
