//
//  ExampleViewController.m
//  PrettyExample
//
//  Created by Víctor on 29/02/12.
//  Copyright (c) 2012 Victor Pena Placer. All rights reserved.
//

#import "ExampleViewController.h"
#import "PrettyKit.h"
#import "ModalViewController.h"


@implementation ExampleViewController


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.backgroundView = nil; 
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return 3;
    }
    if (section == 1) {
        return 1;
    }
    if (section == 2) {
        return 1;
    }
    if (section == 3) {
        return 20;
    }
    if (section == 4) {
        return 1;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    static NSString *SegmentedCellIdentifier = @"SegmentedCell";
    PrettySegmentedControlTableViewCell *segmentedCell;
    static NSString *GridCellIdentifier = @"GridCell";
    PrettyGridTableViewCell *gridCell;

    
    PrettyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[PrettyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.tableViewBackgroundColor = tableView.backgroundColor;        
    }
    
    switch (indexPath.section) {
        case 1:
            switch (indexPath.row) {
                case 0:
                    segmentedCell = [tableView dequeueReusableCellWithIdentifier:SegmentedCellIdentifier];
                    if (segmentedCell == nil) {
                        segmentedCell = [[PrettySegmentedControlTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SegmentedCellIdentifier];
                    }
                    [segmentedCell prepareForTableView:tableView indexPath:indexPath];
                    segmentedCell.titles = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", nil];
                    segmentedCell.tableViewBackgroundColor = tableView.backgroundColor;
                    return segmentedCell;
                default:
                    break;
            }

            break;
        case 2:
            gridCell = [tableView dequeueReusableCellWithIdentifier:GridCellIdentifier];
            if (gridCell == nil) {
                gridCell = [[PrettyGridTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:GridCellIdentifier];
                gridCell.tableViewBackgroundColor = tableView.backgroundColor;
                id bGridCell = gridCell; 
                gridCell.actionBlock = ^(NSIndexPath *indexPath, int selectedIndex) {
                    [bGridCell deselectAnimated:YES];
                };                
            }
            [gridCell prepareForTableView:tableView indexPath:indexPath];            
            gridCell.numberOfElements = 3;
            [gridCell setText:@"One" atIndex:0];
            [gridCell setDetailText:@"Detail Text" atIndex:0];
            [gridCell setText:@"Two" atIndex:1];            
            [gridCell setDetailText:@"Detail Text" atIndex:1];
            [gridCell setText:@"Three" atIndex:2];
            [gridCell setDetailText:@"Detail Text" atIndex:2];            
            return gridCell;
        case 4:
            gridCell = [tableView dequeueReusableCellWithIdentifier:GridCellIdentifier];
            if (gridCell == nil) {
                gridCell = [[PrettyGridTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:GridCellIdentifier];
                gridCell.tableViewBackgroundColor = tableView.backgroundColor;
                id bGridCell = gridCell; 
                gridCell.actionBlock = ^(NSIndexPath *indexPath, int selectedIndex) {
                    [bGridCell deselectAnimated:YES];
                };                
            }
            [gridCell prepareForTableView:tableView indexPath:indexPath];            
            gridCell.numberOfElements = 2;
            [gridCell setText:@"Four" atIndex:0];
            [gridCell setText:@"Five" atIndex:1];            
            return gridCell;

        default:
            break;
    }
    
    // Configure the cell...
    [cell prepareForTableView:tableView indexPath:indexPath];
    cell.textLabel.text = @"Text";
    if (indexPath.section == 0) {
        cell.cornerRadius = 20;
    }
    else {
        cell.cornerRadius = 10;
    }
    
    return cell;
}

#pragma mark - Table view delegate

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return tableView.rowHeight + [PrettyTableViewCell tableView:tableView neededHeightForIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
