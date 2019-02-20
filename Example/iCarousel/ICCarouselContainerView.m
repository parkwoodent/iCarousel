//
//  ICCarouselContainerView.m
//  iCarousel_Example
//
//  Created by Benjamin Maer on 2/20/19.
//  Copyright © 2019 Benjamin Maer. All rights reserved.
//

#import "ICCarouselContainerView.h"

#import <iCarousel/iCarousel.h>





@interface ICCarouselContainerView () <iCarouselDataSource, iCarouselDelegate>

#pragma mark - colors
@property (nonatomic, readonly, strong, nullable) NSArray<UIColor*>* colors;

#pragma mark - carousel
@property (nonatomic, readonly, strong, nullable) iCarousel* carousel;

@end





@implementation ICCarouselContainerView

#pragma mark - UIView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:[UIColor blackColor]];
        
        _colors =
        @[
          [UIColor redColor],
          [UIColor greenColor],
          [UIColor blueColor],
          [UIColor whiteColor],
          [UIColor grayColor],
          [UIColor orangeColor],
          [UIColor purpleColor],
          [UIColor yellowColor]
          ];
        
        _carousel = [iCarousel new];
        [self.carousel setType:iCarouselTypeCustom];
        [self.carousel setDataSource:self];
        [self.carousel setDelegate:self];
        [self.carousel setVertical:NO];
        
        [self addSubview:self.carousel];
        
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.carousel setFrame:self.bounds];
    [self.carousel setItemSize:(CGSize){
        .width      = CGRectGetWidth(self.bounds) - 40.0f,
        .height     = CGRectGetHeight(self.bounds),
    }];
}

#pragma mark - iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.colors.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{
    UIView* const viewToUse =
    (view ?:
     [[UIView alloc] initWithFrame:(CGRect){
        .size.height    = CGRectGetHeight(self.bounds),
    }]);
    viewToUse.backgroundColor = [self.colors objectAtIndex:index];
    return viewToUse;
}

#pragma mark - iCarouselDelegate
- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform {
    CGFloat distance = 50.0f; //number of pixels to move the items away from camera
    CGFloat z = - fminf(1.0f, fabs(offset)) * distance;
    return CATransform3DTranslate(transform, offset * (carousel.itemSize.width + 32), 0.0f, z);
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return 1;
    }

    return value;
}

@end
