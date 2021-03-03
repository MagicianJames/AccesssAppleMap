//
//  Place.swift
//  MapandCamera
//
//  Created by James S on 3/3/2564 BE.
//

import Foundation
import MapKit

class Place {

    var name: String = ""
    var lattitude: CLLocationDegrees = 0.0
    var longtitude: CLLocationDegrees = 0.0
    
    init(name: String, lat: CLLocationDegrees, long: CLLocationDegrees) {
        self.name = name
        self.lattitude = lat
        self.longtitude = long
    }
    
}
