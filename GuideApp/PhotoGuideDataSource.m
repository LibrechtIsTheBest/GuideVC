#import "PhotoGuideDataSource.h"
#import "PhotoGuideViewController.h"

@implementation PhotoGuideDataSource

- (NSInteger)numberOfViewControllersForGuideViewController:(GuideViewController *)vc
{
    return 3;
}

- (UIViewController *)guideViewController:(GuideViewController *)vc viewControllerAtIndex:(NSInteger)index
{
    PhotoGuideViewController *photoVC = [PhotoGuideViewController instance];
    
    if (index == 0) {
        photoVC.image = [UIImage imageNamed:@"1"];
        photoVC.text = @"hfdklf slkdjfak fm,sdjfdsjfdskjfgdskfsdf sdfsd sgfvk,afdhsav fa, bfask bfd f";
        return photoVC;
    }
    else if (index == 1) {
        photoVC.image = [UIImage imageNamed:@"2"];
        photoVC.text = @"uy qlljfsa,mbvhvfb ,dnxz,cbjk gudoeh d;ajfaulsgfky vfsvdhfvd  asdfds fdbsdjsv,fhj vfaje ,ehjsf ewfkjhfv ebfdsfds fdshf bsdf ds fs";
        return photoVC;
    }
    else if (index == 2) {
        photoVC.image = [UIImage imageNamed:@"3"];
        photoVC.text = @"nmcvbxcm bidudbewiydka fakufva ;fiq;py134 gr' q8grefgq79rgq4b fbsjfgdkfjbalbf afgi bfif sbf sfs fad fdsf";
        return photoVC;
    }
    return nil;
}

@end
