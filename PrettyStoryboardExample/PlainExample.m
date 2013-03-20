//
//  PlainExample.m
//  PrettyExample
//
//  Created by Víctor on 22/03/12.
//  Copyright (c) 2012 Victor Pena Placer. All rights reserved.
//

#import "PlainExample.h"
#import "PrettyKit.h"


#define start_color [UIColor colorWithHex:0xEEEEEE]
#define end_color [UIColor colorWithHex:0xDEDEDE]

@implementation PlainExample

- (void) customizeNavBar {
    PrettyNavigationBar *navBar = (PrettyNavigationBar *)self.navigationController.navigationBar;
    
    navBar.topLineColor = [UIColor colorWithHex:0xFF1000];
    navBar.gradientStartColor = [UIColor colorWithHex:0xDD0000];
    navBar.gradientEndColor = [UIColor colorWithHex:0xAA0000];    
    navBar.bottomLineColor = [UIColor colorWithHex:0x990000];   
    navBar.tintColor = navBar.gradientEndColor;
    navBar.roundedCornerRadius = 8;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"Rounded PrettyKit NavBar";
    self.tableView.rowHeight = 60;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:nil action:nil];

    [self.tableView dropShadows];
    [self customizeNavBar];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  {
    return tableView.rowHeight + [PrettyTableViewCell tableView:tableView neededHeightForIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 1) {
        static NSString *GridCellIdentifier = @"GridCell";
        
        PrettyGridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GridCellIdentifier];
        if (cell == nil) {
            cell = [[PrettyGridTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:GridCellIdentifier];
            cell.tableViewBackgroundColor = tableView.backgroundColor;
            cell.gradientStartColor = start_color;
            cell.gradientEndColor = end_color;  
        }
        cell.numberOfElements = 2;
        id bCell = cell; 
        [cell setActionBlock:^(NSIndexPath *indexPath, int selectedIndex) {
            [bCell deselectAnimated:YES];
        }];
        [cell prepareForTableView:tableView indexPath:indexPath];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
        [cell setText:@"Text 1" atIndex:0];
        [cell setText:@"Text 2" atIndex:1];
        [cell setDetailText:@"Subtitle" atIndex:0];
        [cell setDetailText:@"Subtitle" atIndex:1];
        
        return cell;
    }
    
    static NSString *CellIdentifier = @"Cell";
    
    PrettyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[PrettyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.tableViewBackgroundColor = tableView.backgroundColor;        
        cell.gradientStartColor = start_color;
        cell.gradientEndColor = end_color;  
    }
    [cell prepareForTableView:tableView indexPath:indexPath];
    cell.textLabel.text = @"Text";
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    
    return cell;

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
