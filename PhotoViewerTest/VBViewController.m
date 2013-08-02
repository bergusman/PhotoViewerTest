//
//  VBViewController.m
//  PhotoViewerTest
//
//  Created by Vitaly Berg on 7/29/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "VBViewController.h"
#import "VBPhotoView.h"

@interface VBViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation VBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *photos  = @[
        @"up1.jpg",
        @"up2.jpg",
        @"up3.jpg"
    ];
    
    NSInteger count = 10;
    
    CGSize size = self.scrollView.bounds.size;
    
    NSLog(@"%@", self.scrollView);
    
    for (int i = 0; i < count; i++) {
        NSString *photoName = photos[i % [photos count]];
        UIColor *color = [UIColor colorWithHue:(i / (double)count) saturation:1 brightness:1 alpha:1];
        
        VBPhotoView *photoView = [[VBPhotoView alloc] init];
        photoView.image = [UIImage imageNamed:photoName];
        photoView.backgroundColor = color;
        photoView.frame = CGRectMake(size.width * i, 0, size.width, size.height);
        [self.scrollView addSubview:photoView];
    }
    
    self.scrollView.contentSize = CGSizeMake(size.width * count, size.height);
}

#pragma mark - UIScrollViewDelegate

- (IBAction)didPan:(UIPanGestureRecognizer *)sender {
    NSLog(@"did pan");
    
    CGPoint point = [sender translationInView:self.view];
    
    
    CGPoint center = self.scrollView.center;
    center.y += point.y;
    self.scrollView.center = center;
    
    
    [sender setTranslation:CGPointMake(0, 0) inView:self.view];
    
    
}

@end
