//
//  ViewController.m
//  SSSystemInfoSample
//
//  Created by Snow on 6/28/16.
//  Copyright © 2016 Snow. All rights reserved.
//

#import "ViewController.h"
#import "SSSystemInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", [SSSystemInfo deviceString]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
