//
//  AppDelegate.m
//  KK_IM
//
//  Created by Admin on 2021/6/23.
//



#import "AppDelegate.h"

#import "LoginController.h"
#import "HomeController.h"
#import "MainTabBarController.h"

@interface AppDelegate ()
//@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // 设置程序的默认window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:[LoginController new]];
    self.window.rootViewController = self.navigationController;
    // 显示window
    [self.window makeKeyAndVisible];
    return YES;

}






@end
