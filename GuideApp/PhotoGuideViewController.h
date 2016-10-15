#import <UIKit/UIKit.h>
#import "GuideViewController.h"

@interface PhotoGuideViewController : UIViewController <Index>

+ (instancetype)instance;

@property (nonatomic) UIImage *image;
@property (copy, nonatomic) NSString *text;

@end
