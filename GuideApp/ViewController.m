#import "ViewController.h"
#import "GuideViewController.h"
#import "PhotoGuideDataSource.h"

@interface ViewController () 

@property (nonatomic) PhotoGuideDataSource *photoGuideDataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)buttonTouched:(UIButton *)sender
{
    GuideViewController *vc = [GuideViewController instance];
    vc.dataSource = self.photoGuideDataSource;
    [self presentViewController:vc animated:YES completion:nil];
}

- (PhotoGuideDataSource *)photoGuideDataSource
{
    if (_photoGuideDataSource == nil) {
        _photoGuideDataSource = [[PhotoGuideDataSource alloc] init];
    }
    return _photoGuideDataSource;
}

@end











