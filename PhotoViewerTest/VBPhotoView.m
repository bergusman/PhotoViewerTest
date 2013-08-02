//
//  VBPhotoView.m
//  PhotoViewerTest
//
//  Created by Vitaly Berg on 7/29/13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "VBPhotoView.h"

@interface VBPhotoView () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation VBPhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.frame = self.bounds;
        _scrollView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_scrollView];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = self.scrollView.bounds;
        _imageView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_scrollView addSubview:_imageView];
        
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
    
    self.scrollView.frame = CGRectMake(0, 0, 320, 320);
    self.scrollView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.2];
    
    self.imageView.frame = CGRectMake(0, 0, _image.size.width, _image.size.height);
    
    self.scrollView.minimumZoomScale = 0.2;
    self.scrollView.maximumZoomScale = 2;
    self.scrollView.contentSize = CGSizeMake(320, 320);
    self.scrollView.zoomScale = 0.4;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.scrollView.frame = self.bounds;
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}


@end
