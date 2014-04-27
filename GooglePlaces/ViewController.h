//
//  ViewController.h
//  GooglePlaces
//
//  Created by van Lint Jason on 1/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

#define kGOOGLE_API_KEY @"AIzaSyAcJgYblJd1aNT_KDcQqH8f54BvgT4eeHE"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    
    CLLocationCoordinate2D currentCentre;
    int currenDist;
    BOOL firstLaunch;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;


@end
