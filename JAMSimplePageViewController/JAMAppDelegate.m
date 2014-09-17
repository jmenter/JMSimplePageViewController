
#import "JAMAppDelegate.h"
#import "JAMSimplePageViewController.h"
#import "JAMNumberedViewController.h"

@implementation JAMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSMutableArray *viewControllers = NSMutableArray.new;
    for (int i = 1; i <= 10; i++) {
        [viewControllers addObject:[JAMNumberedViewController.alloc initWithNumber:@(i)]];
    }
    
    self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TexturedBackgroundColor"]];
    
    JAMSimplePageViewController *simplePageViewController = [JAMSimplePageViewController.alloc initWithViewControllers:viewControllers transitionStyle:UIPageViewControllerTransitionStyleScroll];
    
    self.window.rootViewController = simplePageViewController;
    [self.window makeKeyAndVisible];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // jump to last page, appear bug
        [simplePageViewController setupPageWithCurrentPage:9];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [simplePageViewController setupPageWithCurrentPage:3];
//        });
    });

    return YES;
}
							
@end
