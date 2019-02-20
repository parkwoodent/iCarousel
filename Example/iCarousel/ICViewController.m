//
//  ICViewController.m
//  iCarousel
//
//  Created by Benjamin Maer on 02/19/2019.
//  Copyright (c) 2019 Benjamin Maer. All rights reserved.
//

#import "ICViewController.h"

#import <iCarousel/iCarousel.h>





@interface ICViewController () <iCarouselDataSource>

#pragma mark - colors
@property (nonatomic, readonly, strong, nullable) NSArray<UIColor*>* colors;

#pragma mark - carousel
@property (nonatomic, readonly, strong, nullable) iCarousel* carousel;

@end





@implementation ICViewController

#pragma mark - UIViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
	
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
    [self.carousel setType:iCarouselTypeLinear];
    [self.carousel setDataSource:self];
    [self.carousel setVertical:NO];

    [self.view addSubview:self.carousel];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.carousel setFrame:self.view.bounds];
    [self.carousel setItemWidth:CGRectGetWidth(self.view.bounds) - 40.0f];
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
        .size.height    = CGRectGetHeight(self.view.bounds),
    }]);
    viewToUse.backgroundColor = [self.colors objectAtIndex:index];
    return viewToUse;
}

@end
