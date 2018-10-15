//
//  SafetyMapViewController.swift
//  Always Safe
//
//  Created by Mirko Ricci on 12/10/2018.
//  Copyright © 2018 Mirko Ricci. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class SafetyMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var SearchBar: UISearchBar!
    @IBOutlet var Map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Map.showsUserLocation = true
        Map.delegate = self
        Map.isZoomEnabled = true
        let userLocation = Map.userLocation.coordinate
        Map.mapType = MKMapType.standard
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last{
                let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 2000, longitudeDelta: 2000))
                self.Map.setRegion(region, animated: true)
                
            }
        }
    }


        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
