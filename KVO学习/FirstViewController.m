//
//  FirstViewController.m
//  KVO学习
//
//  Created by 翟旭博 on 2023/4/25.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()
@property (nonatomic, strong) UIButton *kvoButton;
@property (nonatomic, strong) UILabel *chuanzhiLabel;
@property (nonatomic, strong) UIButton *chuanzhiButton;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //KVO最基本的使用
    self.view.backgroundColor = [UIColor whiteColor];
    self.kvoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.kvoButton.frame = CGRectMake(100, 100, 100, 100);
    self.kvoButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.kvoButton];
    [self.kvoButton addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    //给所要监听的对象注册监听
    [self.kvoButton addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    //KVO传值
    self.chuanzhiLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    self.chuanzhiLabel.text = @"还未传值";
    [self.view addSubview:self.chuanzhiLabel];
    self.chuanzhiButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 500, 100, 100)];
    self.chuanzhiButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.chuanzhiButton];
    [self.chuanzhiButton addTarget:self action:@selector(pressChuanZhi) forControlEvents:UIControlEventTouchUpInside];

}
#pragma - KVO最基本使用
- (void)press {
    //改变被监听对象的值
    [self.kvoButton setValue:[UIColor colorWithRed:arc4random() % 255 / 255.0 green:arc4random() % 255 / 255.0 blue:arc4random() % 250 / 250.0 alpha:1] forKey:@"backgroundColor"];
}

#pragma - KVO传值
- (void)pressChuanZhi {
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    secondViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    //为试图中的属性注册一个监听事件
    [secondViewController addObserver:self forKeyPath:@"content" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self presentViewController:secondViewController animated:YES completion:nil];
}



//当属性变化时会激发该监听方法
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    //打印监听结果
    if ([keyPath isEqual:@"backgroundColor"]) {
        NSLog(@"old value is: %@", [change objectForKey:@"old"]);
        NSLog(@"new value is: %@", [change objectForKey:@"new"]);
    }
    if ([keyPath isEqual:@"content"]) {
        id value = [change objectForKey:@"new"];
        self.chuanzhiLabel.text = value;
    }
}

//移除监听者
- (void)dealloc {
    [self.kvoButton removeObserver:self forKeyPath:@"backgroundColor"];
}



@end
