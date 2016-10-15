#import <UIKit/UIKit.h>

@class GuideViewController;


@protocol Index <NSObject>

@property (nonatomic) NSInteger index;

@end


@protocol GuideViewControllerDataSource <NSObject>

- (NSInteger)numberOfViewControllersForGuideViewController:(GuideViewController *)vc;

- (__kindof UIViewController *)guideViewController:(GuideViewController *)vc viewControllerAtIndex:(NSInteger)index;

@end


@interface GuideViewController : UIViewController

+ (instancetype)instance;

@property (weak, nonatomic) id <GuideViewControllerDataSource> dataSource;

@end
