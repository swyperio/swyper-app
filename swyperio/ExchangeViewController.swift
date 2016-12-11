//
//  ExchangeViewController.swift
//  swyperio
//
//  Created by Jason Yao on 12/9/16.
//  Copyright © 2016 NYU. All rights reserved.
//

import UIKit
import MapKit

class ExchangeViewController: UIViewController {
    // Sets the initial location to be at Bobst Library
    let INITIAL_LOCATION = CLLocation(latitude: 40.729508, longitude: -73.997181)
    
    // Sets the initial radius to be small enough to see the general NYU location
    let INITIAL_RADIUS: CLLocationDistance = 500
    
    // Required to display the map view
    @IBOutlet weak var exchangeView: MKMapView!

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, INITIAL_RADIUS * 2.0, INITIAL_RADIUS * 2.0)
        exchangeView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Centres the map on the initial location
        centerMapOnLocation(location: INITIAL_LOCATION)
        
        // TODO remove after, only for testing to see if the pin works
        let event = Event(
            name: "Test name",
            coordinate: CLLocationCoordinate2D(latitude: 40.729508, longitude: -73.997181),
            startTime: NSDate(),
            endTime: NSDate(timeIntervalSinceReferenceDate: 3600.0),
            maxReservations: 5,
            information: "Test description",
            userID: "thisisatestuserid"
        )
        exchangeView.addAnnotation(event)
        
    } // End of the viewDidLoad function
    
    
    
    
    
    
    
    // Note: Not really required now
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

} // End of the ExchangeViewController
