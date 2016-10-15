#import "PhotoGuideViewController.h"

static NSString *const StoryboardName = @"Main";
static NSString *const PhotoGuideViewControllerStoryboardID = @"PhotoGuideViewControllerStoryboardID";

@interface PhotoGuideViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation PhotoGuideViewController
@synthesize index;

+ (instancetype)instance
{
    return [[UIStoryboard storyboardWithName:StoryboardName bundle:nil]
        instantiateViewControllerWithIdentifier:PhotoGuideViewControllerStoryboardID];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.label.textColor = [UIColor whiteColor];
    self.label.numberOfLines = 0;
    
    self.imageView.image = self.image;
    self.label.text = self.text;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.label.text = text;
}

@end
