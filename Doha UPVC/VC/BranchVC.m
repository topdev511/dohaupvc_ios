//
//  BranchVC.m
//  Doha UPVC
//
//  Created by Star on 10/3/17.
//  Copyright © 2017 Star. All rights reserved.
//

#import "BranchVC.h"
//#import <MapKit/MapKit.h>
//#import "SFAnnotation.h"

#import "BranchDetailVC.h"


@interface BranchVC ()
@property (weak, nonatomic) IBOutlet UIButton *mBtn1;
@property (weak, nonatomic) IBOutlet UIButton *mBtn2;
@property (weak, nonatomic) IBOutlet UIButton *mBtn3;
@property (weak, nonatomic) IBOutlet UIButton *mBtn4;



@end

@implementation BranchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.mBtn1 setTitle:NSLocalizedString(@"salwa_road", @"") forState:UIControlStateNormal];
    [self.mBtn2 setTitle:NSLocalizedString(@"al_wakra", @"") forState:UIControlStateNormal];
    [self.mBtn3 setTitle:NSLocalizedString(@"um_slal", @"") forState:UIControlStateNormal];
    [self.mBtn4 setTitle:NSLocalizedString(@"al_khor", @"") forState:UIControlStateNormal];
    
    /*
    [self.mMapView removeAnnotations:self.mMapView.annotations];
    [self showMapPin:@"Salwa Road Branch" lati:25.239993 lang:51.457769];
    [self showMapPin:@"Wakra Branch" lati:25.164122 lang:51.597436];
    [self showMapPin:@"Al Khor Branch" lati:25.684755 lang:51.495788];
    [self showMapPin:@"Um Slal Branch" lati:25.409177 lang:51.421956];
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(25.409177, 51.421956);
    [self recenterMapRegion:location];
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*
- (void) showMapPin:(NSString*)address lati:(double)lati lang:(double)lang {
    SFAnnotation *annotation = [[SFAnnotation alloc] init];
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(lati, lang);
    annotation.theCoordinate = location;
    annotation.mTitle = address;
    [self.mMapView addAnnotation:annotation];
}

- (void)recenterMapRegion:(CLLocationCoordinate2D)location
{
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 0.65;
    span.longitudeDelta = 0.65;
    
    region.span = span;
    region.center = location;
    
    [self.mMapView setRegion:region animated:YES];
}

#pragma mark - MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    MKAnnotationView *returnedAnnotationView = nil;
    
    // in case it's the user location, we already have an annotation, so just return nil
    if (![annotation isKindOfClass:[MKUserLocation class]])
    {
        if ([annotation isKindOfClass:[SFAnnotation class]]) {
            returnedAnnotationView = [SFAnnotation createViewAnnotationForMapView:self.mMapView annotation:annotation];
            
            // provide the annotation view's image
            UIImage* pin = [Common imageWithImage:[UIImage imageNamed:@"ic_map_default.png"] scaledToSize:CGSizeMake(30,40)];
            
            returnedAnnotationView.image = pin;
            
            //UIImageView *sfIconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
            //returnedAnnotationView.leftCalloutAccessoryView = sfIconView;
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            ((MKPinAnnotationView *)returnedAnnotationView).rightCalloutAccessoryView = rightButton;
        }
    }
    
    return returnedAnnotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // here we illustrate how to detect which annotation type was clicked on for its callout
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[SFAnnotation class]])
    {
        NSLog(@"clicked Golden Gate Bridge annotation");
        [self openNaviMap:annotation.coordinate];
    }
}
*/
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) openNaviMap:(CLLocationCoordinate2D)location {
    
    double lati = location.latitude;
    double lang = location.longitude;
    
    NSString* u = @"http://maps.google.com/maps?q=";
    NSString* url = [NSString stringWithFormat:@"%@%f,%f", u, lati, lang];
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByReplacingOccurrencesOfString:@" " withString:@""]]];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[url stringByReplacingOccurrencesOfString:@" " withString:@""]] options:nil completionHandler:nil];
}
- (IBAction)onBtn1:(id)sender {
    BranchDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BranchDetailVC"];
    vc.branchId = @"1";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onBtn2:(id)sender {
    BranchDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BranchDetailVC"];
    vc.branchId = @"2";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onBtn3:(id)sender {
    BranchDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BranchDetailVC"];
    vc.branchId = @"3";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onBtn4:(id)sender {
    BranchDetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"BranchDetailVC"];
    vc.branchId = @"4";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
