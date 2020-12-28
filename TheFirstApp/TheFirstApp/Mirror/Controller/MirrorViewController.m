//
//  MirrorViewController.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/19.
//

#import "MirrorViewController.h"

@interface MirrorViewController ()

@end

@implementation MirrorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubviews];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)createSubviews {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100.f, 40.f)];
    button.center = self.view.center;
    button.backgroundColor = [UIColor yellowColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
