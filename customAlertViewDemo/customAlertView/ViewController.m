//
//  ViewController.m
//  customAlertView
//
//  Created by Tree on 16/2/15.
//  Copyright © 2016年 Tree. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertView.h"

@interface ViewController ()<CustomIOSAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f]];

    
    
    UIButton *launchDialog = [UIButton buttonWithType:UIButtonTypeCustom];
    [launchDialog setFrame:CGRectMake(10, 30, self.view.bounds.size.width-20, 50)];
    [launchDialog addTarget:self action:@selector(launchDialog:) forControlEvents:UIControlEventTouchDown];
    [launchDialog setTitle:@"Launch Dialog" forState:UIControlStateNormal];
    [launchDialog setBackgroundColor:[UIColor whiteColor]];
    [launchDialog setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [launchDialog.layer setBorderWidth:0];
    [launchDialog.layer setCornerRadius:5];
    [self.view addSubview:launchDialog];
}

- (void)launchDialog:(UIButton *)button {
    // Here we need to pass a full frame
    CustomAlertView *alertView = [[CustomAlertView alloc] init];
    
    // Add some custom content to the alert view
    [alertView setContainerView:[self createDemoView]];
    
    // Modify the parameters
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Close0",@"Close1",@"Close2", @"Close3", @"Close4", nil]];
    [alertView setDelegate:self];
    
    // You may use a Block, rather than a delegate.
    [alertView setOnButtonTouchUpInside:^(CustomAlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
        [alertView close];
    }];
    
    [alertView setUseMotionEffects:true];
    
    // And launch the dialog
    [alertView show];
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
    [alertView close];
}

- (UIView *)createDemoView
{
    //设置按钮上面View的大小，可以放图片等
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 200)];
//    demoView.layer.borderColor = [UIColor redColor].CGColor;
//    demoView.layer.borderWidth = 1;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 270, 180)];
    [imageView setImage:[UIImage imageNamed:@"demo"]];
    [demoView addSubview:imageView];
    
    return demoView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
