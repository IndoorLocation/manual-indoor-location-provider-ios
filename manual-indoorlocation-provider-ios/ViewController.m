#import "ViewController.h"

@interface ViewController () <MWZUIViewDelegate>

@property (nonatomic) MWZUIView* mapwizeView;
@property (nonatomic) ILManualIndoorLocationProvider* provider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MWZUIOptions* opts = [[MWZUIOptions alloc] init];
    MWZUISettings* settings = [[MWZUISettings alloc] init];
    
    self.mapwizeView = [[MWZUIView alloc] initWithFrame:self.view.frame
                                              mapwizeOptions:opts
                                                  uiSettings:settings];
    self.mapwizeView.delegate = self;
    self.mapwizeView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.mapwizeView];
    [[NSLayoutConstraint constraintWithItem:self.mapwizeView
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeLeft
                                 multiplier:1.0f
                                   constant:0.0f] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.mapwizeView
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeTop
                                 multiplier:1.0f
                                   constant:0.0f] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.mapwizeView
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1.0f
                                   constant:0.0f] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.mapwizeView
                                  attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeRight
                                 multiplier:1.0f
                                   constant:0.0f] setActive:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mapwizeView:(MWZUIView *)mapwizeView didTap:(MWZClickEvent *)clickEvent {
    MWZLatLngFloor* llf = clickEvent.latLngFloor;
    ILIndoorLocation* location = [[ILIndoorLocation alloc] initWithProvider: self.provider latitude: llf.coordinates.latitude longitude:llf.coordinates.longitude floor:llf.floor];
    [self.provider setIndoorLocation:location];
}
    
- (void)mapwizeViewDidLoad:(MWZUIView * _Nonnull)mapwizeView {
    self.mapwizeView = mapwizeView;
    self.provider = [[ILManualIndoorLocationProvider alloc] init];
    [self.mapwizeView setIndoorLocationProvider:self.provider];
}


@end
