//
//  ModalViewController.m
//  PrettyExample
//
//  Created by Seth Gholson on 4/25/12.
//  Copyright (c) 2012 NA. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)onDoneClick:(id)sender {
	[self dismissViewControllerAnimated:YES completion:NULL];
}

@end
