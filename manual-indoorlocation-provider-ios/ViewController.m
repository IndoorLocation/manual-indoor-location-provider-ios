#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapwizePlugin = [[MapwizePlugin alloc] initWith:self.mglMapView options:[[MWZOptions alloc] init]];
    self.mapwizePlugin.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mapwizePluginDidLoad:(MapwizePlugin *)mapwizePlugin {
    self.manualLocationProvider = [[ILManualIndoorLocationProvider alloc] init];
    [self.mapwizePlugin setIndoorLocationProvider:self.manualLocationProvider];
}
    
- (void) plugin:(MapwizePlugin *)plugin didTapOnMap:(MWZLatLngFloor *)latLngFloor {
    
    ILIndoorLocation* location = [[ILIndoorLocation alloc] initWithLatitude: latLngFloor.coordinates.latitude longitude:latLngFloor.coordinates.longitude floor:latLngFloor.floor];
    [self.manualLocationProvider setIndoorLocation:location];
    
}
    
@end
