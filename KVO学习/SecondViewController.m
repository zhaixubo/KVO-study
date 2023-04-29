//
//  SecondViewController.m
//  KVO学习
//
//  Created by 翟旭博 on 2023/4/25.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.backButton.frame = CGRectMake(100, 100, 100, 100);
    self.backButton.backgroundColor = [UIColor blueColor];
    [self.backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 250, 200, 50)];
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
}

- (void)pressBack {
    self.content = self.textField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}

//返回NO禁止KVO
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"content"]) {
        return NO;
    } else {
        return [super automaticallyNotifiesObserversForKey:key];
    }
}

@end
