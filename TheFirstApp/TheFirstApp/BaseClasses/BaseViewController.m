//
//  BaseViewController.m
//  TheFirstApp
//
//  Created by chengpiao on 2020/12/19.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithTitle:(NSString *)title tabBarItemIcon:(NSString *)icon tabBarItemSelectedIcon:(NSString *)selectedIcon
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = title;
        UIImage *image = [[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = image;
        UIImage *selectedImage = [[UIImage imageNamed:selectedIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = selectedImage;
    }
    return self;
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
