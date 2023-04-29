//
//  SecondViewController.h
//  KVO学习
//
//  Created by 翟旭博 on 2023/4/25.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : ViewController
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UITextField *textField;
@end

NS_ASSUME_NONNULL_END
