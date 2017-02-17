//
//  AppDelegate.m
//  mvvm_frame
//
//  Created by 和马乐 on 17/2/15.
//  Copyright © 2017年 mvvm. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"
#import "SDTabBarController.h"

@interface AppDelegate ()
@property (nonatomic, strong) SDTabBarController *tabBarController;
@end

@implementation AppDelegate
- (SDTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        SDTabBarController *tabBarController = [[SDTabBarController alloc] init];
        
        UIViewController *mainframeViewController = ({
            FirstViewController *mainframeViewController = [[FirstViewController alloc] init];
            
            UIImage *mainframeImage   = [UIImage imageNamed:@"tabbar_icon_news_normal"];
            UIImage *mainframeHLImage = [UIImage imageNamed:@"tabbar_icon_news_highlight"];
            
            mainframeViewController.title = @"第一";
            mainframeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"第一" image:mainframeImage selectedImage:mainframeHLImage];
            
            mainframeViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tabbar_setting_up"]
                                                                                                         style:UIBarButtonItemStylePlain
                                                                                                        target:self
                                                                                                        action:@selector(didClickAddButton:)];
            
            mainframeViewController;
        });
        
        UIViewController *contactsViewController = ({
            SecondViewController *contactsViewController = [[SecondViewController alloc] init];
            
            UIImage *contactsImage   = [UIImage imageNamed:@"tabbar_icon_bar_normal"];
            UIImage *contactsHLImage = [UIImage imageNamed:@"tabbar_icon_bar_highlight"];
            
            contactsViewController.title = @"第二";
            contactsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"第二" image:contactsImage selectedImage:contactsHLImage];
            
            
            contactsViewController;
        });
        
        UIViewController *discoverViewController = ({
            ThirdViewController *discoverViewController = [[ThirdViewController alloc] init];
            
            UIImage *discoverImage   = [UIImage imageNamed:@"tabbar_icon_found_normal"];
            UIImage *discoverHLImage = [UIImage imageNamed:@"tabbar_icon_found_highlight"];
            
            discoverViewController.title = @"第三";
            discoverViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"第三" image:discoverImage selectedImage:discoverHLImage];
            
            
            discoverViewController;
        });
        
        UIViewController *meViewController = ({
            ForthViewController *meViewController = [[ForthViewController alloc] init];
            
            UIImage *meImage   = [UIImage imageNamed:@"tabbar_icon_me_normal"];
            UIImage *meHLImage = [UIImage imageNamed:@"tabbar_icon_me_highlight"];
            
            meViewController.title = @"第四";
            meViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"第四" image:meImage selectedImage:meHLImage];
            
            
            meViewController;
        });
        
        tabBarController.title = @"网易新闻";
        tabBarController.tabBar.tintColor = [UIColor redColor];
        
        tabBarController.viewControllers = @[
                                             [[UINavigationController alloc] initWithRootViewController:mainframeViewController],
                                             [[UINavigationController alloc] initWithRootViewController:contactsViewController],
                                             [[UINavigationController alloc] initWithRootViewController:discoverViewController],
                                             [[UINavigationController alloc] initWithRootViewController:meViewController],
                                             ];
        
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}


-(void)setWindowRootViewController
{
    NSArray *classArray=@[@"FirstViewController",@"SecondViewController",@"ThirdViewController",@"ForthViewController"];
    NSMutableArray *viewControllers=[[NSMutableArray alloc]init];
    for (NSString *className in classArray) {
        UIViewController *vc=[[NSClassFromString(className)alloc]init];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
        [viewControllers addObject:nav];
    }
    UITabBarController *tabBarController=[[UITabBarController alloc]init];
    tabBarController.viewControllers=viewControllers;
    
    self.window.rootViewController=tabBarController;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //左右滑动，缺点首次加载四个页面
    self.window.rootViewController=self.tabBarController;

    //不添加滑动
    //[self setWindowRootViewController];
    self.window.backgroundColor = [UIColor whiteColor];
    [[HttpManager shareInstance]netWorkReachabilityWithURLString:@"www.baidu.com"];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
