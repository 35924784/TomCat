//
//  ViewController.m
//  汤姆猫
//
//  Created by 淡淡Taurus on 15/6/26.
//  Copyright (c) 2015年 淡淡Taurus. All rights reserved.
//

#import "ViewController.h"
#import "AboutViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Cat;

- (IBAction)drink;

- (IBAction)eat;

- (IBAction)fart;

- (IBAction)scratch;

- (IBAction)pie;

- (IBAction)cymbal;

- (IBAction)knockout;

- (IBAction)footLeft;

- (IBAction)footRight;

- (IBAction)stomach;

- (IBAction)angry;

- (IBAction)show;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//喝牛奶
- (IBAction)drink {
    [self startAnimation:80 myName:@"drink"];
}

//吃
- (IBAction)eat {
    [self startAnimation:39 myName:@"eat"];
}

- (IBAction)fart {
    [self startAnimation:27 myName:@"fart"];
}

- (IBAction)scratch {
    [self startAnimation:55 myName:@"scratch"];
}

- (IBAction)pie {
    [self startAnimation:23 myName:@"pie"];
}

- (IBAction)cymbal {
    [self startAnimation:12 myName:@"cymbal"];
}

- (IBAction)knockout {
    [self startAnimation:80 myName:@"knockout"];
}

- (IBAction)footLeft {
    [self startAnimation:29 myName:@"footLeft"];
}

- (IBAction)footRight {
    [self startAnimation:29 myName:@"footRight"];
}

- (IBAction)stomach {
    [self startAnimation:33 myName:@"stomach"];
}

- (IBAction)angry {
    [self startAnimation:25 myName:@"angry"];
}

- (IBAction)show {
    //初始化
    AboutViewController *controller = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    //视图转换模式
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //采取动画
    [self presentViewController:controller animated:YES completion:nil];

}



- (void)startAnimation:(int)count myName:(NSString *)myName {
    //如果正在播放动画，直接返回
    if (self.Cat.isAnimating) {
        return;
    }
    //图片加载到数组中
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i <= count; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg",myName,i];
        
//        //这种加载图片  太过于占用内存 导致内存溢出
//        UIImage *image = [UIImage imageNamed:imageName];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        [arrayM addObject:image];
    }
    //设置UIImageView 的animationImages 属性 包含的就是要执行的图片
    self.Cat.animationImages = arrayM;
    
    //动画持续时间
    self.Cat.animationDuration = self.Cat.animationImages.count*0.1;
    
    //播放次数
    self.Cat.animationRepeatCount = 1;
    
    //开启动画
    [self.Cat startAnimating];
    
    //清空动画
    [self.Cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.Cat.animationImages.count*0.1];
}
@end
