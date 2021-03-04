//
//  ViewController.swift
//  MapandCamera
//
//  Created by James S on 3/3/2564 BE.
//

import UIKit
//import map here
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    //Note here you should add permission on Info.plist
    //Add Privacy - Location When In Use Usage Description at key
    //Value is Display the nearest favourite places
    //add permission -> right click -> Add row 
    
    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationPermission()
        loadPlaces()
        setMapZoomLevel()
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        setMapZoomLevel()
    }
    
    func checkLocationPermission() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        default:
            break
        }
        
    }
    
    func loadPlaces() {
        var places: [Place] = []
        
        //Add places with latitude and longtitude
        places.append(Place(name: "Shinsen Fish Market", lat: 13.7437582, long: 100.5732368))
        places.append(Place(name: "Tenyuu Grand", lat: 13.7231569, long: 100.5336795))
        
        //        mapView.addAnnotation(places.map({ (place) -> MKPointAnnotation in
        //            let annotation = MKPointAnnotation()
        //            annotation.title = place.name
        //            annotation.coordinate = CLLocationCoordinate2D(latitude: place.lattitude, longitude: place.longtitude)
        //            return annotation
        //        }))
        
        //Pin location
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: place.lattitude, longitude: place.longtitude)
            annotation.subtitle = place.name
            
            mapView.addAnnotation(annotation)
            
        }
    }
    
    func setMapZoomLevel() {
        //zoom map
        
        if let current = locationManager.location{
            
//            let center = CLLocationCoordinate2D(latitude: 13.7231569, longitude: 100.5336795)
            let region = MKCoordinateRegion(center: (current.coordinate), latitudinalMeters: CLLocationDistance(exactly: 10000)!, longitudinalMeters: CLLocationDistance(exactly: 5000)!)
            
            mapView.setRegion(region, animated: true)
        }
    }
}

