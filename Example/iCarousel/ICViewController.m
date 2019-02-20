//
//  ICViewController.m
//  iCarousel
//
//  Created by Benjamin Maer on 02/19/2019.
//  Copyright (c) 2019 Benjamin Maer. All rights reserved.
//

#import "ICViewController.h"
#import "ICCarouselContainerView.h"





@interface ICViewController ()

#pragma mark - carousel
@property (nonatomic, readonly, strong, nullable) ICCarouselContainerView* carouselContainerView;

@end





@implementation ICViewController

#pragma mark - UIViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
	
    _carouselContainerView = [ICCarouselContainerView new];
    [self.view addSubview:self.carouselContainerView];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.carouselContainerView setFrame:self.view.bounds];
}

@end
