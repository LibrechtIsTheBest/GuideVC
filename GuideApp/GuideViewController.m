#import "GuideViewController.h"
#import "PhotoGuideViewController.h"

static NSString *const StoryboardName = @"Main";
static NSString *const GuideViewControllerStoryboardID = @"GuideViewControllerStoryboardID";
static NSString *const GuidePageVCEmbedSegueID = @"GuidePageVCEmbedSegueID";

@interface GuideViewController () <UIPageViewControllerDataSource>

@property (nonatomic) UIPageViewController *pageViewController;

@end

@implementation GuideViewController

+ (instancetype)instance
{
    GuideViewController *vc = [[UIStoryboard storyboardWithName:StoryboardName
        bundle:nil] instantiateViewControllerWithIdentifier:GuideViewControllerStoryboardID];

    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
}

#pragma mark - Target-Action

- (IBAction)closeButtonTouched:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIPageViewControllerDataSource

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if ([viewController conformsToProtocol:@protocol(Index)]) {
        UIViewController <Index> *vc = (UIViewController <Index> *)viewController;
        UIViewController <Index> *previousVC =
            [self.dataSource guideViewController:self
            viewControllerAtIndex:vc.index-1];
        previousVC.index = vc.index-1;
        return previousVC;
    }
    return nil;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    if ([viewController conformsToProtocol:@protocol(Index)]) {
        UIViewController <Index> *vc = (UIViewController <Index> *)viewController;
        UIViewController <Index> *nextVC =
            [self.dataSource guideViewController:self
            viewControllerAtIndex:vc.index+1];
        nextVC.index = vc.index+1;
        return nextVC;
    }
    return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.dataSource numberOfViewControllersForGuideViewController:self];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:GuidePageVCEmbedSegueID]) {
        self.pageViewController = segue.destinationViewController;
        self.pageViewController.dataSource = self;
        
        UIViewController *vc = [self.dataSource guideViewController:self viewControllerAtIndex:0];
        [self.pageViewController setViewControllers:@[vc]
            direction:UIPageViewControllerNavigationDirectionForward
            animated:NO completion:nil];
    }
}

@end
